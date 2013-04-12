/* arrayExt -  Javascript Library to Extend Javascript's array functionalities
http://github.com/haas85/arrayExt.js
Copyright (c) 2013 Iñigo Gonzalez Vazquez(haas85) - Under MIT License
*/


(function() {
  Array.prototype.isArray = true;

  Array.isArray = function(elem) {
    if (elem.isArray != null) {
      return true;
    } else {
      return false;
    }
  };

  Array.prototype.shove = function(elem, check) {
    if (this.index(elem, check) === -1) {
      this.push(elem);
    }
    return this.length;
  };

  Array.prototype.copy = function() {
    return this.concat();
  };

  Array.prototype.hasList = function(list, check) {
    var elem, _i, _len;

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      elem = list[_i];
      if (this.index(elem, check) === -1) {
        return false;
      }
    }
    return true;
  };

  Array.prototype.insert = function(elem, position) {
    this.splice(position, 0, elem);
    return this.length;
  };

  Array.prototype.remove = function(position) {
    if (this.length > position) {
      this.splice(position, 1);
    }
    return this.length;
  };

  Array.prototype.deduct = function(list, check) {
    var elem, pos, _i, _len;

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      elem = list[_i];
      pos = this.index(elem, check);
      if (pos !== -1) {
        this.remove(pos);
      }
    }
    return this.length;
  };

  Array.prototype.merge = function(list, check) {
    var elem, merged, _i, _len;

    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    merged = this.copy();
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      elem = list[_i];
      merged.shove(elem, check);
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

  Array.prototype.same = function(list, check) {
    if (this.hasList(list, check) && this.length === list.length) {
      return true;
    } else {
      return false;
    }
  };

  Array.prototype.intersection = function(list, check) {
    if (!Array.isArray(list)) {
      throw "Exception: Parameter is not an array";
    }
    return this.copy().filter(function(element) {
      return list.index(element, check) !== -1;
    });
  };

  Array.prototype.index = function(value, check) {
    var position;

    if (check != null) {
      position = -1;
      this.copy().filter(function(element, index) {
        if (check(element, value) && position === -1) {
          return position = index;
        }
      });
      return position;
    } else {
      return this.indexOf(value);
    }
  };

}).call(this);
