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

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      elem = list[_i];
      if (this.indexOf(elem) === -1) {
        return false;
      }
    }
    return true;
  };

  Array.prototype.remove = function(position) {
    if (this.length > position) {
      this.splice(position, 1);
    }
    return this.length;
  };

  Array.prototype.difference = function(list) {
    var elem, pos, _i, _len;

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      elem = list[_i];
      pos = this.indexOf(elem);
      if (pos !== -1) {
        this.remove(pos);
      }
    }
    return this.length;
  };

  Array.prototype.merge = function(list) {
    var elem, merged, other, _i, _len;

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    if (this.length > list.length) {
      merged = this.copy();
      other = list;
    } else {
      merged = list.copy();
      other = this;
    }
    for (_i = 0, _len = other.length; _i < _len; _i++) {
      elem = other[_i];
      merged.add(elem);
    }
    return merged;
  };

  Array.prototype.subList = function(first, last) {
    if (first == null) {
      first = 0;
    }
    if (last == null) {
      last = this.length - 1;
    }
    return this.copy().splice(first, last - first + 1);
  };

  Array.prototype.clean = function() {
    return this.copy().filter(function(element) {
      return (element != null) && element !== "";
    });
  };

  Array.prototype.same = function(list) {
    if (this.hasList(list) && this.length === list.length) {
      return true;
    } else {
      return false;
    }
  };

  Array.prototype.intersection = function(list) {
    return this.copy().filter(function(element) {
      return list.indexOf(element) !== -1;
    });
  };

}).call(this);
