var fs = require('fs');
var _ = require('lodash');
var transformer = require('./transformer');

module.exports = function() {

  var accessKey = '';
  var options = {
    uri: 'http://access.alchemyapi.com/calls/text/TextGetRankedNamedEntities?',
    method: 'POST',
    body: '',
    headers : {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    }
  };

  function init() {
    console.log('alchemy init...');
    fs.readFile('.alchemy_access_token', 'utf-8', function(err, data) {
      accessKey = data.trim();
      console.log(data);
    });
  }

  function createEntityRequest(payload) {
    options.uri = 'http://access.alchemyapi.com/calls/text/TextGetRankedNamedEntities?';
    options.body = 'apikey=' + accessKey +
      '&text=' + payload +
      '&outputMode=json' ;

    return options;
  }


  function transformEntityResponse(data) {
    console.log('alchemy transform...');
    var result = [];
    _.forEach(data.entities, function(entity) {
      result.push(entity.text);
    });
    return transformer.normalize(result);
  }

  function createKeywordRequest(payload) {
    options.uri = 'http://gateway-a.watsonplatform.net/calls/text/TextGetRankedKeywords';
    options.body = 'apikey=' + accessKey +
      '&text=' + payload +
      '&outputMode=json';

    return options;
  }

  function transformKeywordResponse(data) {
    console.log('alchemy transform keyword...');
    return transformer.normalize(
      // FIXME: find a good metric
      _.pluck(_.filter(data.keywords, function(v) {return v.relevance >= 0.6; }), 'text')
    );
  }


  return {
    init: init,
    createEntityRequest: createEntityRequest,
    transformEntityResponse: transformEntityResponse,
    createKeywordRequest: createKeywordRequest,
    transformKeywordResponse: transformKeywordResponse
  }
}
