arrayext.js
===========

A lightweight Javascript Library that extends Javascript's array functionalities.

## Using arrayext.js

Just import arrayExt.js file from the package folder into your project and arrays will automatically have new functions.
Or you can use it in your node server installing the arrayext.js package (npm install arrayext.js) - https://npmjs.org/package/arrayext.js

* [index](#index)
* [same](#same)
* [hasList](#hasList)
* [copy](#copy)
* [sublist](#sublist)
* [shove](#shove)
* [insert](#insert)
* [remove](#remove)
* [clean](#clean)
* [intersection](#intersection)
* [deduct](#deduct)
* [merge](#merge)
* [isArray](#isArray)


<a name="index" />
### index(value, comparisonFunction)
Returns the position of the value in the array and -1 if it doesn't exists, it accepts an optional comparison function as a parameter to check the value

Usage:

    var foo1 = [{a: 1, b: 2}, {a: 3, b: 4}];
    var foo2 = [1,2,3,4];

    var check = function(elem, value) {     /* elem is the array element and value the value we send */
      return elem.a === value;
    };

    foo1.index(3, check);       /* Returns 1 */
    foo1.index(8, check);       /* Returns -1 */

    foo2.index(3);              /* Returns 2 */

<a name="same" />
### same(array, comparisonFunction)
Compares two arrays and returns true if they are the same, it accepts an optional comparison function as a parameter to check the elements.
The order of the elements doesn't matter.

Usage:

    var foo1 = [1,3,5,7,9];
    var foo2 = [1,3,5,7,9];

    var check = function(elem1, elem2){      /* elem1 is the array element and elem2 the element of the array we send */
      return elem1 === elem2;
    };

    foo1.same(foo2);             /* Returns true*/
    foo1.same(foo2, check);      /* Returns true*/

    foo2.push(2);

    foo1.same(foo2);             /* Returns false*/
    foo1.same(foo2, check);      /* Returns false*/

<a name="hasList" />
### hasList(array, comparisonFunction)
Checks if the array passed as a parameter is a subList, it accepts an optional comparison function as a parameter to check the elements.
The order of the elements doesn't matter.

Usage:

    var foo1 = [1,3,5,7,9];
    var foo2 = [1,3,5];
    var foo3 = [1,6];

    var check = function(elem1, elem2){      /* elem1 is the array element and elem2 the element of the array we send */
      return elem1 === elem2;
    };

    foo1.hasList(foo2);             /* Returns true*/
    foo1.hasList(foo2, check);      /* Returns true*/

    foo1.hasList(foo3);             /* Returns false*/

<a name="copy" />
### copy()
Returns a shallow copy of the array

Usage:

    var foo1 = [1,3,5,7];
    var foo2 = foo1.copy();

    foo1 == foo2  /* Returns false */

<a name="sublist" />
### sublist(init, end)
Returns the sublist of elements thar are between the init and end positions, if init is null it will be 0, and if end is null it will be the last element

Usage:

    var foo = [2,4,6,8,0];

    foo.sublist(1,3);            /* Returns [4, 6, 8]*/

<a name="shove" />
### shove(value, comparisonFunction)
Pushes an element into the array only if it doesn't exist. It returns the length of the array. It allows to use a comparison function to check if the value exists

Usage:

    var foo = [1,3,5,7];

    foo.shove(9);   /* Returns 5 and foo is [1,3,5,9] */
    foo.shove(9);   /* Returns 5 and foo is [1,3,5,9] */

    /* With comparison function */

    var foo = [{a: 1, b: 2}];

    var check = function(elem, value) {     /* elem is the array element and value the value we send */
      return elem.a === value.a;
    };

    foo.shove({a:3, b:4}, check);  /* Returns 2 and foo is [{a: 1, b: 2}, {a:3, b:4}] */
    foo.shove({a:3, b:4}, check):  /* Returns 2 and foo is [{a: 1, b: 2}, {a:3, b:4}] */

<a name="insert" />
### insert(value, position)
Inserts a value in the specified position. Returns the new length of the array

Usage:

    var foo = [1,5,9];

    foo.insert(3,2));      /* Returns 4 and foo is [1,5,3,9] */

<a name="remove" />
### remove(position)
Removes the element in the specified position. Returns the new length of the array

Usage:

    var foo = [1,3,5,7,9];

    foo.remove(3));      /* Returns 4 and foo is [1,5,3,9] */

<a name="clean" />
### clean()
Deletes the falsy elements (undefined, null or empty string) from the array.

Usage:

    var foo = [0,1,2,null,"hello",""];

    foo.clean();        /* foo is [0,1,2,"hello"] */

<a name="intersection" />
### intersection(array, comparisonFunction)
Returns an array with the elements that are in both arrays, it accepts an optional comparison function to check the values

Usage:

    var foo1 = [1,3,5,7,9];
    var foo2 = [1,2,5,6,9];

    foo1.intersection(foo2);      /* Returns [1,5,9] */

    var foo3 = [{a: 1, b:2}, {a: 3, b: 4}];
    var foo4 = [{a: 1, b:2}];

    var check = function(elem1, elem2){     /* elem1 is the array element and elem2 the element of the array we send */
      elem1.a == elem2.a
    };

    foo3.intersection(foo4, check);      /* Returns [{a: 1, b:2}] */

<a name="deduct" />
### deduct(array, comparisonFunction)
Returns an array wihout the elements that has the array that receives, it accepts an optional comparison function to check the values

Usage:

    var foo1 = [1,3,5,7,9];
    var foo2 = [5,9];

    foo1.deduct(foo2);      /* Returns [1,3,7] */

    var foo3 = [{a: 1, b:2}, {a: 3, b: 4}];
    var foo4 = [{a: 1, b:2}];

    var check = function(elem1, elem2){     /* elem1 is the array element and elem2 the element of the array we send */
      elem1.a == elem2.a
    };

    foo3.deduct(foo4, check);      /* Returns [{a: 3, b:4}] */

<a name="merge" />
### merge(array, comparisonFunction)
Returns an array that is the merge operation between the arrays, it accepts an optional comparison function to check the values

Usage:

    var foo1 = [1,3,5,7,9];
    var foo2 = [2,4,5,6,8,9];

    foo1.merge(foo2);      /* Returns [1,3,5,7,9,2,4,6,8] */

    var foo3 = [{a: 1, b:2}, {a: 3, b: 4}];
    var foo4 = [{a: 1, b:2}, {a: 5, b:6}];

    var check = function(elem1, elem2){     /* elem1 is the array element and elem2 the element of the array we send */
      elem1.a == elem2.a
    };

    foo3.merge(foo4, check);      /* Returns [{a: 1, b:2}, {a: 3, b:4}, {a: 5, b:6}] */
