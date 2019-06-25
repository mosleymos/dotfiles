// Approche 1

function generator(sequencer) {
  return {next: sequencer.apply(null, [].slice.call(arguments, 1))};
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  var pos = 0, count = 1;
  return function() {
    if(pos == 0) {pos++; return count;}
    return count *= pos++;
  }
}

function fibonacciSeq() {
  var last = 0, now = 1, next = 1;
  return function() {
    last = now;
    now = next;
    next = last + now;
    return last;
  }
}

function rangeSeq(start, step) {
  return function() {
    var tmp = start;
    start += step;
    return tmp;
  }
}

function primeSeq() {
  var count = 0;
  return function() {
    if(sieve[count] == null) generateNextPrime();
    return sieve[count++];
  }
}

function partialSumSeq() {
  var seq = [].slice.call(arguments), pos = 0, running = seq[pos];
  return function() {
    var tmp = running;
    if(isNaN(tmp)) throw Error('End of sequence error');
    running += seq[++pos];
    return tmp;
  }
}

//Uses an ever-expanding Sieve of Eratosthenes to test for primes
var sieve = [2,3,5,7,11];
function generateNextPrime() {
  var current = sieve[sieve.length - 1] + 2;
  while (true) {
    if (isPrimeFromSieve(current)) {
      sieve.push(current);
      break;
    }
    current += 2;
  }
}

function isPrimeFromSieve(num) {
  var max = Math.ceil(Math.sqrt(num));
  for (var i = 0; i < sieve.length; i++) {
    if (num % sieve[i] === 0) return false;
    else if (max < sieve[i]) return true;
  }
  return true;
}


// Approche 2

function generator(sequencer, ...args) {
  var f = sequencer(...args);
  return {
    next() {return f()}
  };
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  var fact = 1, i = 0;
  return () => {
    if(!i) {
      i++;
      return 1;
    }
    return fact *= i++;
  }
}

function fibonacciSeq() {
  var a = 0, b = 1;
  return () => {
    [a, b] = [b, a + b];
    return a;
  }
}

function rangeSeq(start, step) {
  var cur = start - step;
  return () => cur += step;
}

function primeSeq() {
  var primes = [2];
  return () => {
    var p = primes[primes.length - 1] + 1;
    for(var i = 0; primes[i] * primes[i] <= p; i++)
      if(p % primes[i] == 0) {
        i = -1;
        p++;
      }
    primes.push(p);
    return primes[primes.length - 2];
  }
}

function partialSumSeq(...args) {
  var i = 0, sum = 0;
  return () => {
    if(i >= args.length)
      throw new RangeError('Sequence is over');
    return sum += args[i++];
  }
}

// Approche 3

function generator(sequencer, ...args) {
  return {
    next: sequencer(...args)
  };
}

function dummySeq() {
  return function () {
    return "dummy";
  };
}

function factorialSeq(i = 0) {
  return function () {
    return (function fac(n) {
      return n < 1 ? 1 : n * fac(n - 1);
    })(i++);
  };
}

function fibonacciSeq(a = 0, b = 1) {
  return function () {
    [a, b] = [b, a + b];
    return a;
  };
}

function rangeSeq(s, st) {
  return function () {
    s += st;
    return s - st;
  };
}

function primeSeq(i = 1) {
  return function () {
    return (function pr() {
      return (++i > 1) && [...Array(1 + ~~Math.sqrt(i))].every(function (x, y) { return (y < 2) || (i % y !== 0)}) ? i : pr(i);
    })();
  };
}

function partialSumSeq(...args) {
  let sum = 0;
  return function () {
    sum += args.shift();
    if (sum) return sum;
    throw "End of sequence";
  };
}

// Approche 4

function generator(sequencer) {
  var args = Array.prototype.slice.call(arguments, 1);
  return {next: sequencer(...args)};
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  var fact = 1, i = 0;
  return () => i ? (fact *= i++) : ++i;
}

function fibonacciSeq() {
  var [prev, curr] = [0, 1];
  return () => ([prev, curr] = [curr, prev + curr], prev);
}

function rangeSeq(start, step) {
  return () => [start, start += step][0];
}

function primeSeq() {
  var i = 1, primes = [];
  function isPrime(i) {
    for(var prime of primes) if (i%prime == 0) return false;
    primes.push(i);
    return true;
  }
  return () => { while(i++) if (isPrime(i)) return i; };
}

function partialSumSeq(...args) {
  var sum = 0;
  return () => {
    if (args.length == 0) throw 'error!';
    return sum += args.shift();
  };
}

// Approche 5
let generator = (sequencer, ...args) => {
  return {
    next: sequencer(...args)
  };
};

let dummySeq = () => () => 'dummy';

function factorialSeq() {
  let factorial = n => n < 2 ? 1 : factorial(n - 1) * n;
  let i = 0;
  
  return () => factorial(i++);
}

function fibonacciSeq() {
  let fibonacci = n => n < 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2);
  let i = 0;
  
  return () => fibonacci(i++);
}

function rangeSeq(start, step) {
  let i = 0;
  
  return () => start + (step * i++);
}

function primeSeq() {
  let primes = [2, 3, 5, 7, 11, 13, 17, 19];
  let i = 0;
  
  return () => primes.shift();
}

function partialSumSeq(...nums) {
  let sum = 0;
  let i = 0;
  
  return () => {
    n = nums.shift();
    if (n === undefined) {
      throw new TypeError('Out of bounds');
    }
    
    return sum += n;
  };
}

// Approche 6

function generator(sequencer, ...params) {
  const nextSequence = sequencer(...params)
  
  return {
    next() {
      return nextSequence()
    }
  }
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  let result = 1
  let multiplicator = 0
  
  return () => {
    if (!multiplicator) return ++multiplicator
    
    return result = result * multiplicator++
  }
}

function fibonacciSeq() {
  let [prev, next] = [0, 1]
  
  return () => {
    [prev, next] = [next, next + prev]
    return prev
  }
}

function rangeSeq(start, step) {
  let current = start
  return () => {
     current += step
     return current - step
  }
}

function primeSeq() {
  let current = 1
  return () => {
    let isPrime = true
    
    do {
      current++
      isPrime = true
      for (let i = current - 1; i > 1; i--) {
        if (current / i === Math.floor(current / i)) {
          isPrime = false
          break
        }
      }
      
    } while (!isPrime)
    
    return current
  }
}

function partialSumSeq(...elements) {
  let i = 0
  let sum = 0
  
  return () => {
    if (i >= elements.length) throw new Error('End of sequence')
    return sum += elements[i++]
  }
}

// Approche 7

function generator(sequencer) {
  var otherArgs = Array.from(arguments).slice(1);
  var gen = sequencer(...otherArgs);
  return {
    next: function(arguments){
      return gen(arguments);
    }
  }  
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  let fac = 0;
  return function(){
    if(fac === 0){
      fac += 1;
      return 1;
    } else {
      let res = 1;
      for(let i = 1; i < fac + 1; i++){
        res *= i;
        console.log(res);
      }
      fac += 1;
      return res;
    }
  }
}

function fibonacciSeq() {
  function fibbonaci(num){
    if(num === 0){
      return 1;
    } else if (num === 1){
      return 1;
    } else if (num === 2){
      return 2;
    } else {
      return fibbonaci(num - 2) + fibbonaci(num - 1);
    }
  }
  let counter = 0;
  return function(){
    let res = fibbonaci(counter);
    counter += 1;
    return res;
  }
}

function rangeSeq(start, step) {
  return function(){
    const temp = start;
    start += step;
    return temp;
  }
}

function primeSeq() {
  function prime(num){
    return Array.from(Array(num), (_, index) => index + 1).filter(x => num % x === 0).length === 2;
  }
  function genPrimes(num){
    return Array.from(Array(num), (_, index) => index + 1).filter(x => prime(x));
  }
  const primes = genPrimes(1000);
  let counter = 0;
  return function(){
    let res = primes[counter];
    counter += 1;
    return res;
  }
}

function partialSumSeq(...args) {
  let res = args[0];
  let counter = 1;
  return function(){
    const temp = res;
    res += args[counter];
    counter += 1;
    if(counter > args.length + 1){
      throw new Error("End of Sequence");
    }
    return temp;
  }
}

// Approche 7
const generator = (s, ...a) => {
  const g = (...a) => s(...a);
  g.next = g(...a);
  return g;
}

const dummySeq = _ => _ => "dummy";

const factorialSeq = _ => {
  let [n, r] = [0, 1];
  return _ => r *= n++ || 1;
}

const fibonacciSeq = _ => {
  let [p, c] = [0, 0];
  return _ => c = p + (p = c) || 1;
}

const rangeSeq = (start, step) => {
  let c = start - step;
  return _ => c += step;
}

const primeSeq = _ => {
  const isPrime = n => {
    for (let i = 2; i <= Math.sqrt(n); i++)
      if (n % i == 0) return false;
    return n > 1;
  }
  let c = 0;
  return _ => {
    while (!isPrime(c++));
    return c - 1;
  }
}

const partialSumSeq = (...a) => {
  let [r, i] = [0, 0];
  return _ => {
    if (i >= a.length) throw Error('asdf');
    return r += a[i++];
  }
}

// Approche 8
function generator(sequencer, ...args) {
  var seq = sequencer(...args);
  
  this.next = () => seq();
  
  return this;
}

var

dummySeq = () => () => "dummy",

factorialSeq = (value = 0) => {
  var factorial = n => n ? n * factorial(n - 1) : 1;
  
  return () => factorial(value++);
},

fibonacciSeq = (value = 1) => {
  var fib = n => n <= 1 ? n : fib(n - 1) + fib(n - 2);
  
  return () => fib(value++);
},

rangeSeq = (start = 0, step = 1) => {
  return () => (start += step, start - step);
},

primeSeq = (value = 0) => {
  var isPrime = n => {
    if(n < 2) return false;
    
    for (var i = 2; i < n; i++)
      if(!(n % i))
        return false;
    
    return true;
  };
  
  return () => {
    while (!isPrime(value++));
    return value - 1;
  };
},

partialSumSeq = (...args) => {
  var i = 0,
      value = 0;
  
  return () => {
    if (i == args.length)
      throw new Error();
    
    return (value += args[i++], value);
  };
};

// Approche 9
function generator(sequencer) {
  var args = Array.prototype.slice.call(arguments, 1);
  return {next: sequencer(...args)};
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  var fact = 1, i = 0;
  return () => i ? (fact *= i++) : ++i;
}

function fibonacciSeq() {
  var [prev, curr] = [0, 1];
  return () => ([prev, curr] = [curr, prev + curr], prev);
}

function rangeSeq(start, step) {
  return () => [start, start += step][0];
}

function primeSeq() {
  var i = 1, primes = [];
  function isPrime(i) {
    for(var prime of primes) if (i%prime == 0) return false;
    primes.push(i);
    return true;
  }
  return () => { while(i++) if (isPrime(i)) return i; };
}

function partialSumSeq(...args) {
  var sum = 0;
  return () => {
    if (args.length == 0) throw 'error!';
    return sum += args.shift();
  };
}
