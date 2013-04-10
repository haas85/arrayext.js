describe "Array", ->

  checkArray = (value) ->
    Array.isArray value

  it "is right", ->
    expect(Array).toBeTruthy()

  it "is array", ->
    expect(checkArray [1,2,3]).toBe true

  it "is not array", ->
    expect(checkArray "FOO").not.toBe true

  it "add element if does not exists", ->
    foo = [0..5]
    len = foo.length

    expect(foo.shove 1).toEqual len
    expect(foo.shove 16).toEqual len + 1

  it "shallow copy of an array", ->
    foo1 = [0..5]
    foo2 = foo1.copy()
    foo2.shove 6

    expect(foo2.length).toEqual foo1.length + 1

  it "array has a list of alements", ->
    foo1 = [0..10]
    foo2 = [3..8]
    foo3 = [5..11]

    expect(foo1.hasList foo2).toBe true
    expect(foo1.hasList foo3).not.toBe true

  it "remove an element at a position", ->
    foo = [0..10]
    len = foo.length

    expect(foo.remove 5).toEqual len - 1

  it "taking out a list of elements from an array", ->
    foo1 = [0..10]
    foo2 = [2,5]
    len = foo1.length

    expect(foo1.deduct foo2).toEqual len - 2

  it "Merging two arrays", ->
    foo1 = [0..10]
    foo2 = [4,8,15,16,23,42]

    merged = foo1.merge foo2

    expect(merged.length).toEqual foo1.length + 4

  it "get sublist based on init and end", ->
    foo = [0..10]

    sublist = foo.subList 2, 5

    expect(sublist.length).toEqual 4

  it "clean falsy values", ->
    foo1 = [0,1,null, "", "foo"]
    foo2 = foo1.clean()

    expect(foo2.length).toEqual 3

  it "arrays are the same", ->
    foo1 = [0..10]
    foo2 = foo1.copy()
    foo3 = [2..5]
    foo4 = [1..11]
    foo5 = [-1..11]

    expect(foo1.same foo2).toBe true
    expect(foo1.same foo3).toBe false
    expect(foo1.same foo4).toBe false

  it "returns the intersection of the arrays", ->
    foo1 = [0..10]
    foo2 = [2,4,6,8]

    expect(foo1.intersection(foo2).length).toEqual 4

  it "insert element in a specific position", ->
    foo = [0,1,3,4,5,6,7,8,9]
    len = foo.length
    foo.insert 2, 2

    expect(foo[2]).toEqual 2
    expect(foo.length).toEqual len + 1
