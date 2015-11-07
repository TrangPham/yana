var _ = require('lodash');

module.exports = {
  normalize: function(list) {
    return _.uniq( _.map(list, function(v) {
      return v.toLowerCase().replace(/_/g, ' ');
    }));
  }
};
