// Took from http://raganwald.com/2012/12/01/combinators-in-js.html
// Splat

// Exemple of usage:
// var squareMap = splat(function (n) {
//   return n*n
// });
//
// squareMap([1, 2, 3, 4, 5])
//   //=> [1, 4, 9, 16, 25]

function splat(fn){
  return function(list){
    return Array.prototype.call(list,fn)
  }
}

// var inventory = {
//   apples: 0,
//   oranges 144,
//   eggs: 36
// };
//
// get('oranges')(inventory)
//   //=> 144

function get(attr){
  return function(objet){
     return object[attr]
  }
}

// Combination
// var inventories = [
//   { apples: 0, oranges: 144, eggs: 36 },
//   { apples: 240, oranges: 54, eggs: 12 },
//   { apples: 24, oranges: 12, eggs: 42 }
// ];
//
// splat(get('oranges'))(inventories)
//   //=> [ 144, 54, 12 ]
//


// pluck('eggs')(inventories)
//   //=> [ 36, 12, 42 ]
//

function pluck (attr) {
  return splat(get(attr))
}


// maybe function or monae => to think about

// Exemple of uses
//
// function checksForSomething = maybe(function (value) {
//   // function's true logic
// });
//
// var something = maybe(doesntCheckForSomething)(value);
//
// // Ultimage usage
// arrayOfObjects.map(maybe(get('name')))
//

function maybe (fn) {
  return function () {
    var i;

    if (arguments.length === 0) {
      return
    }
    else {
      for (i = 0; i < arguments.length; ++i) {
        if (arguments[i] == null) return arguments[i]
      }
      return fn.apply(this, arguments)
    }
  }
}

// kestrel
// Faire des side effects avec des varibles et fonctions mais retourne toujours la variable d'entree
// exemple
// log = kestrel(4)(console.log('hello'))
// => hello
// => 4
// la variable log === 4
var kestrel = function(x){
  return function(y){
    return x
  }
}

// Version simple
var log = function(something){
  console.log(something)
  return something
}

// Version avec kestrel
var log = function(something){
  return kestrel(something)(console.log(something))
}

// Simple assert
// assert((1 === 1))
var assert = function(condition){
  return condition ? true : false
}

// Apply a function and one argument
var applyOneArgumentOneFunction(fn,arg1){
  return fn(arg1)
}

// Compose function
// cf https://leanpub.com/javascriptallongesix/read#combinators
function compose(a,b){
  return function(c){
    return a(b(c))
  }
}


function not(fn){
 return function(x){
   return !fn(x)
   }
 }

// Identity function
// identity(3) === 3
function identity(fnOrValue){ return fnOrValue }

 // Monad to think
 // Usage: 
 // var unit = monad()
 // var monad = unit("Hello wworld")
 // monad.bind(alert)
function monad(unit){
   return function unit(value){
      var monad = Object.create(null)
      monad.bind = function(func){ return func(value) }
      return monad ;
  }
}

// Benchmark easy js snippets
// Simple Perf test on javascript snippets ( from
// http://coding.smashingmagazine.com/2012/11/05/writing-fast-memory-efficient-javascript/
// )
// fron gist https://gist.github.com/mattstauffer/4018160
 var totalTime,
     start = new Date,
         iterations = 1000;
         while (iterations--) {
           // Code snippet goes here
           }
           // totalTime → the number of milliseconds taken 
           // to execute the code snippet 1000 times
           totalTime = new Date - start;
