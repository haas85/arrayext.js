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
  if Array.isArray list
    for elem in list
      pos = @indexOf(elem)
      @remove pos if pos isnt -1
    @length
  else throw "Exception: Parameter is not an array"

Array.prototype.merge = (list) ->
  if Array.isArray list
    if @length > list.length
      merged = @copy()
      other = list
    else
      merged = list.copy()
      other = @
    for elem in other
      merged.add elem
    merged
  else throw "Exception: Parameter is not an array"

Array.prototype.subList = (first=0, last=@length-1) ->
  @copy().splice first, last - first + 1