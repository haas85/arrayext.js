describe "Module", ->

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

    expect(foo.add 1).toEqual len
    expect(foo.add 16).toEqual len + 1

  it "shallow copy of an array", ->
    foo1 = [0..5]
    foo2 = foo1.copy()
    foo2.add 6

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

    expect(foo1.difference foo2).toEqual len - 1

  it "Merging two arrays", ->
    foo1 = [0..10]
    foo2 = [4,8,15,16,23,42]

    merged = foo1.merge foo2

    expect(merged.length).toEqual foo1.length + 4