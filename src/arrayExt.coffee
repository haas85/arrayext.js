Array::isArray = true

Array.isArray = (elem)-> if elem.isArray? then true else false

Array::shove = (elem) ->
  @push elem if @indexOf(elem) is -1
  @length

Array::copy = -> do @concat

Array::hasList = (list) ->
  throw "Exception: Parameter is not an array" unless Array.isArray list
  for elem in list
    return false if @indexOf(elem) is -1
  true

Array::insert = (elem, position) ->
  @splice position, 0, elem
  @length

Array::remove = (position) ->
  @splice position, 1 if @length > position
  @length

Array::deduct = (list) ->
  throw "Exception: Parameter is not an array" unless Array.isArray list
  for elem in list
    pos = @indexOf(elem)
    @remove pos if pos isnt -1
  @length

Array::merge = (list) ->
  throw "Exception: Parameter is not an array" unless Array.isArray list
  if @length > list.length
    merged = @copy()
    other = list
  else
    merged = list.copy()
    other = @
  for elem in other
    merged.shove elem
  merged

Array::subList = (first=0, last=@length-1) -> @copy().splice first, last - first + 1

Array::clean = -> @copy().filter (element) -> element? and element isnt ""

Array::same = (list) -> if @hasList(list) and @length is list.length then true else false

Array::intersection = (list) -> @copy().filter (element) -> list.indexOf(element) isnt -1