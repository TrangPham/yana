var request = require('request');
var static = require('node-static');
var express = require('express');
var bodyParser = require('body-parser');
var elasticsearch = require('elasticsearch');
var fs = require('fs');

var opencalais = require('./opencalais')();
var dandelion = require('./dandelion')();
var alchemy = require('./alchemy')();


opencalais.init();
dandelion.init();
alchemy.init();

setTimeout(function() {
  // var payload = 'The Mona Lisa is a 16th century oil painting created by Leonardo. It\'s held at the Louvre in Paris.';
  var payload = 'We had already decided we would offer our bodies to a medical school. Our lawyer pointed out that the medical school would likely want to examine the brain of someone with dementia, particularly when that person had kept a public diary of sorts. I think my columns have provided much of that information. I would like to put myself in a position where I could help in pursuit of a cure for dementia. I know it sounds ghoulish, even perhaps a bit self-serving, but that’s the kind of conversation we need to have before the inevitable. It’s important for everyone, but, in my case, it’s important to have those conversations now.';
  var oPayload = opencalais.createEntityRequest(payload);
  var dPayload = dandelion.createEntityRequest(payload);
  var aPayload = alchemy.createKeywordRequest(payload);

/*
  request(dPayload, function(err, response, data) {
    console.log(dandelion.transformEntityResponse(JSON.parse(data)));
  });

  request(oPayload, function(err, response, data) {
    console.log(opencalais.transformEntityResponse(JSON.parse(data)));
  });
  */

  request(aPayload, function(err, response, data) {
    console.log(alchemy.transformKeywordResponse(JSON.parse(data)));
  });

}, 2000);






///////////////////////////////////////////////////////////////////////////////
// Server
///////////////////////////////////////////////////////////////////////////////
var file = new(static.Server)('./');
var app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.post('/api/calais', function(req, res) {
  var name = req.body.name;
  var text = req.body.text;

  request(opencalais.createEntityRequest(text), function(err, response, data) {
    res.statusCode = 200;
    res.header('Content-Type', 'application/json');
    res.json(opencalais.transformEntityResponse(JSON.parse(data)) );
  });
});

app.post('/api/dandelion', function(req, res) {
  var name = req.body.name;
  var text = req.body.text;

  request(dandelion.createEntityRequest(text), function(err, response, data) {
    res.statusCode = 200;
    res.header('Content-Type', 'application/json');
    res.json(dandelion.transformEntityResponse(JSON.parse(data)) );
  });
});


app.post('/api/alchemy', function(req, res) {
  var name = req.body.name;
  var text = req.body.text;

  request(alchemy.createKeywordRequest(text), function(err, response, data) {
    res.statusCode = 200;
    res.header('Content-Type', 'application/json');
    res.json(alchemy.transformKeywordResponse(JSON.parse(data)) );
  });
});


app.post('/api/entry', function(req, res) {

  var payload = req.body.payload;
  console.log('body', payload);

  var options = {
    uri: 'http://localhost:9200/yana/entry',
    method: 'POST',
    body: payload
  };

  request(options, function(err, response, data) {
    console.log('ES', data);
    res.statusCode = 200;
    res.json({});
  });

});



app.get('/api/trend', function(req, res) {

  // last 5 days
  var t = (new Date()).getTime() - (5 * 24 * 60 * 60 * 1000);
  t /= 1000;

  var str = new Date(t);

  var body = {
    query: {
        range: {
          created_at : {
            gte: str 
          }
        }
    }
  };

  var options = {
    uri: 'http://localhost:9200/yana/entry/_search',
    method: 'GET',
    body: JSON.stringify(body)
  };

  request(options, function(err, response, data) {
    console.log('search result:', data);

    res.statusCode = 200;
    res.json(JSON.parse(data).hits.hits);

  });



});


app.get('/api/search', function(req, res) {
  console.log('Q ', req.query.q);

  var qstr = req.query.q;
  var qlist = qstr.split(' ');

  console.log('Q2', qlist);

  var tagQueryList = [];
  qlist.forEach(function(d) {
    tagQueryList.push({
      "term": {
        "tags.raw": d
      }
    });
  });


  var body = {
    query: {
      bool: {
        should: [
          {
            bool: {
              should: tagQueryList,
              "minimum_number_should_match": 1
            }
          },
          {
            bool: {
              should: [
                {
                  more_like_this: {
                    fields: ['content'],
                    like: qlist,
                    min_term_freq: 1,
                    min_doc_freq: 1,
                    boost: 5
                  }
                }
              ]
            }
          }
        ]
      }
    }
  };

  var options = {
    uri: 'http://localhost:9200/yana/entry/_search',
    method: 'GET',
    body: JSON.stringify(body)
  };

  request(options, function(err, response, data) {
    console.log('search result:', data);

    res.statusCode = 200;
    res.json(JSON.parse(data).hits.hits);

  });

});


/*
app.post('/api/alchemy', function(req, res) {
  var name = req.body.name;
  var text = req.body.text;

  request(alchemy.createEntityRequest(text), function(err, response, data) {
    res.statusCode = 200;
    res.header('Content-Type', 'application/json');
    res.json(alchemy.transformEntityResponse(JSON.parse(data)) );
  });
});
*/



////////////////////////////////////////////////////////////////////////////////
// This needs to go last
////////////////////////////////////////////////////////////////////////////////
app.get(/\w*/, function(req, res){
   file.serve(req, res);
});


app.listen(54321);
console.log('Start server on :54321');
