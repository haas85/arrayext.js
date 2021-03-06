### arrayExt -  Javascript Library to Extend Javascript's array functionalities
http://github.com/haas85/arrayExt.js
Copyright (c) 2013 Iñigo Gonzalez Vazquez(haas85) - Under MIT License ###
# Array::isArray = true

# Array.isArray = (elem)-> if elem.isArray? then true else false

Array::shove = (elem, check) ->
  @push elem if @index(elem, check) is -1
  @length

Array::copy = -> do @concat

Array::hasList = (list, check) ->
  # throw "Exception: Parameter is not an array" unless Array.isArray list
  for elem in list
    return false if @index(elem, check) is -1
  true

Array::insert = (elem, position) ->
  @splice position, 0, elem
  @length

Array::remove = (position) ->
  @splice position, 1 if @length > position
  @length

Array::deduct = (list, check) ->
  # throw "Exception: Parameter is not an array" unless Array.isArray list
  for elem in list
    pos = @index(elem, check)
    @remove pos if pos isnt -1
  @length

Array::merge = (list, check) ->
  # throw "Exception: Parameter is not an array" unless Array.isArray list
  merged = @copy()
  for elem in list
    merged.shove elem, check
  merged

Array::subList = (first=0, last=@length-1) -> @copy().splice first, last - first + 1

Array::clean = -> @copy().filter (element) -> element? and element isnt ""

Array::same = (list, check) -> if @hasList(list, check) and @length is list.length then true else false

Array::intersection = (list, check) ->
  # throw "Exception: Parameter is not an array" unless Array.isArray list
  @copy().filter (element) -> list.index(element, check) isnt -1

Array::index = (value, check) ->
  if check?
    position = -1
    @copy().filter (element, index) -> position = index if check(element, value) and position is -1
    position
  else
    @indexOf value