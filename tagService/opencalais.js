var fs = require('fs');
var _ = require('lodash');
var transformer = require('./transformer');

module.exports = function() {

  var options = {
    uri: 'https://api.thomsonreuters.com/permid/calais?',
    method: 'POST',
    body: '',
    headers : {
      'x-ag-access-token': '<read_token_from_file>',
      'x-calais-language': 'English',
      'Content-Type': 'text/raw',
      'Accept': 'application/json',
      'outputFormat': 'application/json'
    }
  };


  function init() {
    // console.log('opencalais init...');
    fs.readFile('.calais_access_token', 'utf-8', function(err, data) {
      options.headers['x-ag-access-token'] = data;
      console.log(data);
    });
  };

  function createEntityRequest(payload) {
    console.log('opancalais create...');
    options.body = payload;
    return options;
  }

  function transformEntityResponse(data) {
    console.log('opancalais transform...', data);
    var result = [];
    _.forEach(data, function(v, k) {

      // Extract entities
      if (v.hasOwnProperty('_typeGroup') && v._typeGroup === 'entities') {
        result.push( v.name );
      }
      if (v.hasOwnProperty('_typeGroup') && v._typeGroup === 'topics') {
        result.push( v.name );
      }
      if (v.hasOwnProperty('_typeGroup') && v._typeGroup === 'socialTag') {
        result.push( v.name );
      }
    })
    return transformer.normalize(result);
  }

  return {
    init: init,
    createEntityRequest: createEntityRequest,
    transformEntityResponse: transformEntityResponse
  }

}
