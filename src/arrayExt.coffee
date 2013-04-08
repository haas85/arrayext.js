Array.prototype.isArray = true

Array.isArray = (elem)->
  if elem.isArray? then true else false

Array.prototype.add = (elem) ->
  @push elem if @indexOf(elem) is -1
  @length

Array.prototype.copy = ->
  do @concat

Array.prototype.hasList = (list) ->
  "TODO"

Array.prototype.remove = (position) ->
  "TODO"

Array.prototype.deduct = (list) ->
  "TODO"

Array.prototype.merge = (list) ->
  "TODO"