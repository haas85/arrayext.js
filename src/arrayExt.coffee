Array.prototype.isArray = true

Array.isArray = (elem)->
  if elem.isArray? then true else false

Array.prototype.add = (elem) ->
  @push elem if @indexOf(elem) is -1
  @length

Array.prototype.copy = ->
  do @concat

Array.prototype.hasList = (list) ->
  if Array.isArray list
    for elem in list
      return false if @indexOf(elem) is -1
    true
  else throw "Exception: Parameter is not an array"

Array.prototype.remove = (position) ->
  @splice position, 1 if @length > position
  @length

Array.prototype.difference = (list) ->
  "TODO"

Array.prototype.merge = (list) ->
  "TODO"