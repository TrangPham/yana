var fs = require('fs');
var _ = require('lodash') ;
var transformer = require('./transformer');

module.exports = function() {

  var appId, accessKey;
  var uri = 'https://api.dandelion.eu/datatxt/nex/v1';

  var options = {
    uri: uri,
    method: 'POST',
    body: '',
    headers : {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    }
  };


  function init() {
    console.log('dandelio init...');
    fs.readFile('.dandelion_access_token', 'utf-8', function(err, data) {
      data = data.trim();
      appId = data.split('=')[0];
      accessKey = data.split('=')[1];
      console.log(appId, ' - ',  accessKey);
    });
  }

  function createEntityRequest(payload) {
    console.log('dandelion create...');

    options.body = 'min_confidence=0.2' +
      '&$app_id=' + appId +
      '&$app_key=' + accessKey +
      '&text=' + payload;

    return options;
  }

  function transformEntityResponse(data) {
    console.log('dandelion transform');
    return transformer.normalize(
      _.filter(_.pluck(data.annotations, 'label'), function(v) {
        return v.split(/\s/).length <= 3;
      })
    );
  }

  return {
    init: init,
    createEntityRequest: createEntityRequest,
    transformEntityResponse: transformEntityResponse
  };
}
