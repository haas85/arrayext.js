(function() {
  Array.prototype.isArray = true;

  Array.isArray = function(elem) {
    if (elem.isArray != null) {
      return true;
    } else {
      return false;
    }
  };

  Array.prototype.add = function(elem) {
    if (this.indexOf(elem) === -1) {
      this.push(elem);
    }
    return this.length;
  };

  Array.prototype.copy = function() {
    return this.concat();
  };

  Array.prototype.hasList = function(list) {
    var elem, _i, _len;

    if (Array.isArray(list)) {
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        elem = list[_i];
        if (this.indexOf(elem) === -1) {
          return false;
        }
      }
      return true;
    } else {
      throw "Exception: Parameter is not an array";
    }
  };

  Array.prototype.remove = function(position) {
    if (this.length > position) {
      this.splice(position, 1);
    }
    return this.length;
  };

  Array.prototype.difference = function(list) {
    var elem, pos, _i, _len;

    if (Array.isArray(list)) {
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        elem = list[_i];
        pos = this.indexOf(elem);
        if (pos !== -1) {
          this.remove(pos);
        }
      }
      return this.length;
    } else {
      throw "Exception: Parameter is not an array";
    }
  };

  Array.prototype.merge = function(list) {
    return "TODO";
  };

}).call(this);
