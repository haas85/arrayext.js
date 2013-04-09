Array::isArray = true

Array.isArray = (elem)->
  if elem.isArray? then true else false

unless Array::filter
  Array::filter = (fun) ->
    len = @length
    throw new TypeError()  unless typeof fun is "function"
    res = new Array()
    thisp = arguments_[1]
    i = 0
    while i < len
      if i of this
        val = this[i]
        res.push val  if fun.call(thisp, val, i, this)
      i++
    res

Array::add = (elem) ->
  @push elem if @indexOf(elem) is -1
  @length

Array::copy = ->
  do @concat

Array::hasList = (list) ->
  if Array.isArray list
    for elem in list
      return false if @indexOf(elem) is -1
    true
  else throw "Exception: Parameter is not an array"

Array::remove = (position) ->
  @splice position, 1 if @length > position
  @length

Array::difference = (list) ->
  if Array.isArray list
    for elem in list
      pos = @indexOf(elem)
      @remove pos if pos isnt -1
    @length
  else throw "Exception: Parameter is not an array"

Array::merge = (list) ->
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

Array::subList = (first=0, last=@length-1) ->
  @copy().splice first, last - first + 1

Array::clean = ->
  clean = (element) -> element? and element isnt ""
  @copy().filter clean