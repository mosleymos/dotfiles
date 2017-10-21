Codewars notes
========

![Codewars](https://www.codewars.com/users/mosleymos/badges/micro)

## Resolu

### Python

Detect Pangram

```python

import string

def is_pangram(s):
    return (len(set([i.lower() for i in list(s)])) >= 26)

```

```python
def add_binary(a,b):
    return bin(a+b)[2:]
```

split strings

```python

def solution(s):
  def chunks(l, n):
    return [l[i:i + n] for i in range(0, len(l), n)]
    if (len(list(s)) % 2 == 0):
      return chunks(s,2)
    else:
      s+='_'
      return chunks(s,2)

```

Sum of two lowest positive integers

```python

def sum_two_smallest_numbers(numbers):
  numbers.sort(reverse=True)
  a = numbers.pop()
  b = numbers.pop()
  return a + b

```

Remove the minimum

```python

def remove_smallest(numbers):
    if (len(numbers) == 0):
        return []
    to_remove = min(numbers)
    numbers.remove(to_remove)
    return numbers

```

shortest word

```python

def find_short(s):
    return min([len(i) for i in s.split(' ')])

```

### Ruby

remember

```ruby

def remember(str)
  stack = []
  result = []
  str.chars.each do |letter|
    stack.push(letter)
    result << letter if stack.count(letter) > 1 && !result.include?(letter)
  end
  result
end

# Better approaches


def remember(str)
  seen = Hash.new(0)
  str.chars.select do |c| 
    seen[c] += 1
    seen[c] == 2 
  end
end

def remember(str)
  str.chars.select.with_index{|x,i| str.index(x) != i}.uniq
end
```

head, tail, init and last

```ruby

def head(arr)
  arr[0]
end

def tail(arr)
  arr[1..-1]
end

def init(arr)
  arr[0..-2]
end

def last(arr)
  arr[-1]
end

```

Counting Array Elements

```ruby
def count(array)
  uniq_hash = {}
  array.each do |e|
    if uniq_hash[e].nil?
      uniq_hash[e] = 1
    else
      uniq_hash[e]+=1
    end 
  end
  uniq_hash
end

# Other approach better
def count(array)
  c = Hash.new(0)
  array.each { |i| c[i] += 1  }
  c
end

def count(array)
  array.reduce(Hash.new(0)) { |a, b| a[b] += 1; a }
end

```

string ends with?

```ruby

def solution(str,ending)
  str.end_with?(ending)
end

```

binary addition

```ruby
def add_binary(a,b)
  (a+b).to_s(2)
  end

```

Odd-Even string sort

```ruby

def sort_my_string(s)
   left = []
   right = []
    s.split('').each_with_index do |letter, index|
      left << letter if index.odd?
      right << letter if index.even?
    end
    [right, ' ' ,left].join
end

```

shortest word

```ruby

def find_short(s)
  s.split(" ").map(&:size).min
end

```

chain me

```ruby

def chain(number,fns)
  fns.size.zero? ? number : chain(Object.send(fns.shift, number),fns)
end

```

backspace in string

```ruby

def clean_string(string)
  res = []
  string.chars.each{|a|
    a == '#' ?  res.pop : res << a 
  }
 res.join('')
end

```

multiple of 3 and 5

```ruby

def solution(number)
  (1...number).select{|number| number % 3 == 0 or number % 5 == 0 }.reduce(&:+)
end

```

sum of all arguments

```ruby

function sum(nombres) {
  result = []
  for(i in arguments){
    result.push(arguments[i])
  }
  return result.reduce(function(a,b){ return a + b });
}

```

numerical palindrome

```ruby


def palindrome(num)
  return "Not valid" unless num.is_a? Integer 
  return "Not valid" if num.zero? 
  return "Not valid" if num < 0 
  num.to_s === num.to_s.reverse
end

```

Basic math (add or substract)

```ruby
def calculate(str)
  (eval str.gsub(/plus/,'+').gsub(/minus/,'-')).to_s
end

```

Two oldest ages

```ruby

def two_oldest_ages(ages)
  ages.max(2).sort
end

```

Persistent bugger

```ruby

def persistence number
  return 0 if number.to_s.split('').size == 1
  count = 0

  begin 
    number = number.to_s.split('').map(&:to_i).reduce(:*)
    count += 1
  end while number.to_s.split('').size > 1

  return count
end

```

Sum of numbers from 0 to N

```ruby

class SequenceSum
  def self.show_sequence(n)
   return "#{n}<0" if n < 0
   return "0=0" if n.zero?
   "#{0.upto(n).map(&:to_s).join('+')} = #{ 0.upto(n).reduce(:+)}"
  end
end

```

Square(n) Sum

```ruby

def squareSum(numbers)
  numbers.map{|n| n*n }.reduce(&:+)
end

```






CamelCase method

```ruby

class String
  def camelcase
    self.split(' ').map(&:capitalize).join('')
  end
end

```

Largest 5 digits numbers in a series

```ruby

def solution(digits)
  digits.split(//).each_cons(5).to_a.map do |tb|
    tb.join.to_i
  end.max
end

```

Array Helpers

```ruby

class Array
  def square
    self.map do |e| e**2 end
  end
  
  def cube
     self.map do |e| e**3 end
  end
  
  def sum
    self.inject(&:+)
  end
  
  def average
    self.sum/self.length
  end
  
  def even
    self.select do |e| e.even? end
  end
  
  def odd
    self.select do |e| e.odd? end
  end
end

```

List filtering

```ruby

def filter_list(l)
  l.select{|e| !e.is_a?(String)}
end

```

is every value in the array an array?

```ruby

def arrCheck(value)
  value.all?{|e| e.is_a?(Array)}
end

```

Exclamation marks series #11: Replace all vowel to exclamation mark in the sentence

```ruby

def replace(s)
  s.gsub(/a|e|i|o|u|A|E|I|O|U/,"!")
end

```

Help Bob count letters and digits.

```ruby

def count_letters_and_digits(input)
  input.scan(/[[:digit:]]|[[:alpha:]]/).size
end

```

Identical elements

```ruby

def duplicate_elements(m, n)
    # write your solution here
    return m.any?{|e| n.include?(e) } ? true : false
end

```

The if function

```ruby

# ifTrue et ifFalse sont des proc genre proc{|e| e.methode_execute }
def _if(bool, ifTrue, ifFalse)
  bool ? ifTrue.call : ifFalse.call
end

```

Sum mixed array

```ruby

def sum_mix(x)
  x.map(&:to_i).reduce(&:+)
end

```

String repeat

```ruby

def repeat_str (n, s)
  s * n
end

```

Get numbers from a string

```ruby

def get_number_from_string(s)
  s.gsub(/[[:digit:]]/).to_a.reduce(&:+).to_i
end

```

Beginner Reduce but grow

```ruby

def grow(x) 
  x.reduce(&:*)
end

```

Opposite number

```ruby

def opposite(num)
  num > 0 ?  -(num) : (num).abs 
end

```


Return negative

```ruby

def makeNegative(num)
  num > 0 ? -(num) : num
end

```

Sum of positive

```ruby

def positive_sum(arr)
  return 0 if arr.empty? || arr.all?{|e| e < 0 }
  arr.select{|n| n >= 0}.reduce(&:+)
end

```

GrassHopper shopping list

```ruby

#your code here
sandwiches = 4
salads = 6
wraps = 5
frenchFries = 10
totalPrice = [sandwiches*8, salads*7, wraps*6.50, frenchFries*1.20].reduce(&:+)

```


Ruby Array invoke instance method

```ruby

class Array
  def invoke(method, *args, &block)
    select(&block)
    .map do |elt|
      elt.send(method.to_sym, *args.to_a)
    end
  end
end

```

Rotate an array matrix

```ruby

def rotate matrix, direction
   return matrix.transpose.map(&:reverse) if direction == 'clockwise'
   return matrix.transpose.reverse if direction == 'counter-clockwise'
end

```

```ruby

def power(base, exponent)
   return nil if exponent < 0
   return 1 if exponent.zero?
   Array.new(exponent,base).reduce(&:*)
end

other approaches

def power(base, exponent)
  exponent.times.inject(1){ |product| product * base } unless exponent < 0
end

def power(base, exponent)
  (1..exponent).inject(1){|v| v * base} unless exponent < 0
end

```

altERnaTIng cAsE <=> ALTerNAtiNG CaSe

```ruby

class String
  def to_alternating_case
    self.swapcase
  end
end

```

IQ test

```ruby

def iq_test(chaine_nbre)
   tab_of_integer = chaine_nbre.split(' ').map(&:to_i)
   if tab_of_integer.count(&:odd?) > tab_of_integer.count(&:even?)
       return tab_of_integer.map(&:even?).index(true) + 1
   else
       return tab_of_integer.map(&:odd?).index(true) + 1
   end
end

```

find missing numbers

```ruby

def find_missing_numbers(arr)
  return [] if arr ==[] || arr == [0]
  ((arr.min)..(arr.max)).to_a - arr
end

```

simple validation of username with regex

```ruby

def validate_usr(username)
   return true if (username =~ /^[a-z0-9_]{4,16}$/) == 0 
   return false
end


```

Validate code with simple regex

```ruby

def validate_code(code)
  #your code here
  code.to_s.start_with?("1","2","3")
end

```

Lucky number

```ruby

def is_lucky(n)
  n.to_s.split('').map(&:to_i).reduce(&:+) % 9 == 0 ? true : false
end

```

Reversed Strings

```ruby

def solution(str)
  str.reverse
end

```

Permutations

```ruby

def permutations(string)
  return string.split('').permutation(string.length).to_a.map{|e| e.reduce(&:+)}.uniq
end

```

Pascal's Triangle

```ruby

def pascalsTriangle(depth)
  result = []
  case depth
    when 1
      return [[1]].flatten
    when 2
      return [[1],[1,1]].flatten
    else
      result = [[1]]
      (1..depth).each do |e|
      result.push(result[e-1].each_cons(2).map{|pred,suiv| pred+suiv}.push(1).insert(0,1))
     end
  end
  return result[0,result.length-1].flatten
end

```

Pascal's Triangle #2

```ruby

def pascal(depth)
  result = []
  case depth
    when 1
      return [[1]]
    when 2
      return [[1],[1,1]]
    else
      result = [[1]]
      (1..depth).each do |e|
      result.push(result[e-1].each_cons(2).map{|pred,suiv| pred+suiv}.push(1).insert(0,1))
     end
  end
  return result[0,result.length-1]
end

```

Pyramid Array

```ruby

def pyramid(numbers)
  result = []
  numbers.times do |e|
    result << Array.new(e+1,1)
  end
  result
end

```

Number toString

```ruby

a = some_number.to_s

```

Basic variable assignement

```ruby

a = "code"
b = "wa.rs"
name = a + b

```

Re-Open class

```ruby
#Re-open the class String and add the my_new_method method. Solution 1
class Object
  def my_new_method
  end
end

class String < Object 
  def my_new_method 
    upcase
  end
end

# Solution 02
class String
  def my_new_method ; self.upcase() ; end
end

```

Highest and lowest

```ruby

def high_and_low(numbers)
  "#{numbers.split(' ').map(&:to_i).max} #{numbers.split(' ').map(&:to_i).min}"
end

# Other approaches
def high_and_low(numbers)
  numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

def high_and_low(numbers)
  numbers = numbers.split.map(&:to_i)
  "#{numbers.max} #{numbers.min}"
end

```

### javascript


Re-Open class

```javascript

//Re-open the class String and add the "myNewMethod" method.
String.prototype.myNewMethod = function(){
  return this.toUpperCase();
};

```

Are they square

```javascript

var isSquare = function(arr){
  try {
    var see = arr.map(function(e){
      return Math.sqrt(e)* Math.sqrt(e) === e;
    }).reduce(function(a,b){ return a+b;});
    return arr.length === see ;
  }catch(error){ 
    return undefined; 
  }
}

```

Regex count on lowercase letters

```javascript

function lowercaseCount(str){
    if(str === ""){
      return 0;
    }else{
      return str.replace(/[^a-z]/g,'').length;
    }
}

```

Validate code with simple regex

```javascript

function validateCode (code) {
  return /^[123]/.test(String(code));
}

```

Closures and scopes

```javascript

function createFunctions(n) {
  var callbacks = [];
  var z = 0;
  for (var i=0; i<n; i++) {
    callbacks.push(function() {
      return z++;
    });
  }
  
  return callbacks;
}

```

Basic javascript operations

```javascript

const basicOp = (operation, value1, value2) => {
  let calcul = value1 + operation + value2
  return eval(calcul)
}

```

Even or Odd - which is Greater

```javascript

function evenOrOdd(stringOfNumber) {

    let evenNumberTotal = stringOfNumber.split('')
    .map((stringNumber) =>{  return Number(stringNumber) })
    .filter((number) => { return number % 2 == false })
    .reduce((first,second) => { return first + second })

    let oddNumberTotal = stringOfNumber.split('')
    .map((stringNumber) =>{  return Number(stringNumber) })
    .filter((number) => { return number % 2 == true })
    .reduce((first,second) => { return first + second })

    if (oddNumberTotal > evenNumberTotal){
     return 'Odd is greater than Even';
    }else if(oddNumberTotal < evenNumberTotal){
      return 'Even is greater than Odd';
    }else if(oddNumberTotal === evenNumberTotal){
      return 'Even and Odd are the same';
    }else{
      return void 0;
    }
}

```

Largest pair su_m in array

```javascript

largestPairSum = (numbers) => numbers.sort((a,b) => a < b ? 1 : -1).slice(0,2).reduce((a,b) => a+b )

```

Replace all dots

```javascript

var replaceDots = function(str) {
  var regex = /\./g
  return str.replace(regex, '-');
}

```

odd or even

```javascript

oddOrEven = (array) => {
  if(array.length == 0){ return 'even'}
  return array.reduce((a,b) => a+b) %2 == 0 ? 'even' : 'odd'
}

```

Currying functions multiply all elements in a array

```javascript

multiplyAll = (arrayOfNumber) => (number) => arrayOfNumber.map(e => e*number)

```

Describe a list

```javascript

function describeList(x) {
  if(x.length === 0){ return 'empty' }
  return x.length === 1 ? 'singleton' : 'longer'
}

```

Sum of all arguments

```javascript

function sum(nombres) {
  result = []
  for(i in arguments){
    result.push(arguments[i])
  }
  return result.reduce(function(a,b){ return a + b });
}

```

esreveR

```
var reverse = function(array){
  var reversedArray = []
  var i = array.length -1
  for(i; i >= 0 ; i--){ reversedArray.push(array[i]) }
  return reversedArray
}
```

```Keep up the hoop

function hoopCount (n) {
  return n < 10 ? "Keep at it until you get it" : "Great, now move on to tricks"
}

```

ROT13

```javascript

var decrypt = (str) => {
  var encrypt = new Map();
    encrypt.set('a','n')
    encrypt.set('b','o')
    encrypt.set('c','p')
    encrypt.set('d','q')
    encrypt.set('e','r')
    encrypt.set('f','s')
    encrypt.set('g','t')
    encrypt.set('h','u')
    encrypt.set('i','v')
    encrypt.set('j','w')
    encrypt.set('k','x')
    encrypt.set('l','y')
    encrypt.set('m','z')
    encrypt.set('n','a')
    encrypt.set('o','b')
    encrypt.set('p','c')
    encrypt.set('q','d')
    encrypt.set('r','e')
    encrypt.set('s','f')
    encrypt.set('t','g')
    encrypt.set('u','h')
    encrypt.set('v','i')
    encrypt.set('w','j')
    encrypt.set('x','k')
    encrypt.set('y','l')
    encrypt.set('z','m')
  return Array.from(str).map((e) => encrypt.get(e)).join('')
}

var rot13 = (phrase) =>  phrase.split(' ').map((word) => decrypt(word)).join(' ') 

```

Open or Senior 

```javascript
// Solutions

var  openOrSenior = (data) => data.map((member) => member[0]>= 55 && member[1] > 7 ? 'Senior' : 'Open')


function openOrSenior(data){
  return data.map(([age, handicap]) => (age > 54 && handicap > 7) ? 'Senior' : 'Open');
}

```


Simple calculator

```javascript

function calculator(a,b,sign){
  if(typeof(a) === 'string' || typeof(b) === 'string')
    return "unknown value";
  switch(sign){
    case "+":
       return a + b
       break;
    case "-":
        return a-b
        break;
  
    case "*":
        return a*b
        break;
  
    case "/":
        return a/b;
        break
    default:
         return "unknown value";
         break;
  }
  
}

```

remove first and last character

```javascript

function removeChar(str){
  return str.slice(1, str.length -1 )
};

```

make function that does arithmetic

```javascript

arithmetic = (a, b, operator) => {
   switch(operator){
   case "add":
     return a+b;
     break
   case "subtract":
     return a-b;
     break
   case "multiply":
     return a*b;
     break
   case "divide":
      return a/b;
      break
   }
}


```

Array helpers

```javascript

Array.prototype.square = function(){ 
  return this.map(function(nbr){ 
     return nbr * nbr ;
  })
}

Array.prototype.cube = function(){ 
  return this.map(function(nbr){ 
     return nbr * nbr *nbr ;
  })
}

Array.prototype.sum = function(){ 
  if(this.length === 0)
    return 0
  return this.reduce(function(a,b){ 
     return a+b ;
  })
}

Array.prototype.average = function(){
  return this.sum() / this.length 
}

Array.prototype.even = function(){
   return this.filter(function(nbr){
      return nbr%2 === 0 ? nbr : undefined
   })
}

Array.prototype.odd = function(){
      return this.filter(function(nbr){
      return nbr%2 !== 0 ? nbr : undefined
   })
}

```

List filtering

```javascript

function filter_list(l) {
  // Return a new array with the strings filtered out
  var result = [];
  l.filter(function(item){
    if(typeof(item)==="number"){
        result.push(item);
        }
   });
  return result;
}

```

Generate range of integers


```javascript

function generateRange(min, max, step){
   var result = [];
   for(var i = min; i <= (max) ; i+= step){
     result.push(i)
   }
   return result
}

```



### SQL

SQL Basics: Simple WHERE and ORDER BY

```SQL

SELECT * FROM people WHERE (people.age > 50) ORDER BY age DESC; 

```

SQL Basics: simple sum

```SQL

SELECT SUM(age) AS age_sum FROM people;

```

SQL Basics : Simple MIN MAX

```SQL

SELECT MIN(age) AS age_min, MAX(age) AS age_max FROM people;

```

SQL Basics: Simple DISTINCT

```SQL

SELECT DISTINCT age FROM people;

```


SQL basics Find all active students:

```SQL

SELECT * FROM students WHERE isActive = 1;

SELECT * FROM students WHERE IsActive;

SELECT FirstName,LastName,IsActive FROM students WHERE IsActive = 1 ;

```

Collect Tuition (SQL for Beginners)

```SQL

SELECT * FROM students WHERE tuition_received=false; 

SELECT * FROM students WHERE NOT tuition_received; 

```

Easy SQL: Cube Root and Natural Log

```SQL

SELECT CBRT(number1) AS cuberoot ,LN(number2) AS logarithm FROM decimals;

# Other approaches
SELECT
  CBRT(NUMBER1)AS CUBEROOT,
  LN(NUMBER2)AS LOGARITHM
FROM
  DECIMALS


SELECT
  ||/NUMBER1 AS CUBEROOT,
  LN(NUMBER2) AS LOGARITHM
FROM
  DECIMALS


select ||/number1 as cuberoot, ln(number2) as logarithm from decimals


``` 

On the Canadian Border (SQL for Beginners #2)


```SQL

SELECT name,country FROM travelers WHERE NOT country='USA' AND NOT country='Mexico' AND NOT country='Canada';

# Other approach
Select name,country from travelers where country not in ('Canada','Mexico','USA')


```

Easy SQL lowercase



```SQL

SELECT  id ,name, birthday ,LOWER(race) AS race FROM demographics ;

```

## En reflexion

Comment en javascript on peut effectuer un each_cons ???

Comprehend arrays in python in Ruby or javascript


### Ruby

Reverse polish notation calculator

```ruby
def calc(chaine)
  return 0 if chaine == ''
  stack = []
  chaine.split(' ').each do |elem|
    if !elem.match(/\+|\-|\*|\//)

      stack << Float(elem) 

    elsif elem.match(/\+/)
      result = stack.reduce(&:+)
      stack.clear
      stack.push(result)

    elsif elem.match(/\-/)
      result = stack.reduce(&:-)
      stack.clear
      stack.push(result)

    elsif elem.match(/\*/)
      result = stack.reduce(&:*)
      stack.clear
      stack.push(result)

    elsif elem.match(/\//)
      result = stack.reduce(&:/)
      stack.clear
      stack.push(result)

    end

  end

  return stack.size > 1 ? stack[-1].to_f : stack[0]

end


# Autre solution en cours qui est meilleure

def calc(chaine)
  return 0 if chaine == ''
  expression = chaine.split
  return eval expression.last if not expression.last =~ /\*|\/|\+|\-/
  res = 0
  stack = []
  expression.each do |op| 
    case op
      when '+', '-', '/', '*'
        res = eval(stack.join(op))
        stack = []
        stack << res.to_s
      else
        stack << op
    end  
  end

  eval stack.first
end
``` 
to think about [Reverse polish notation thread](https://gist.github.com/malandrina/3744867)

Hamming Numbers

Custom array filters

https://www.codewars.com/kata/custom-array-filters/train/ruby

Valid parantheses

https://www.codewars.com/kata/valid-parentheses/train/ruby

```ruby

def valid_parentheses(string)
    return false if string.start_with?(')') || string.end_with?('(')
    stack = []
    string.split('').map do |char|
      if char == '('
        stack.push('(')
      elsif char ==')'
        stack.pop
      end
    end
    stack.empty?
end

```

Prefill an array

```ruby

def prefill(n,v=nil)
  raise TypeError, "#{n} is invalid" if ((n =~ /[[:alpha:]]/) == 0) || v == nil
  Array.new(n.to_i,v)
end

```

Sum of many ints

https://www.codewars.com/kata/sum-of-many-ints/train/ruby

```

def f(n,m)
  (0..n).reduce{|sum, num| sum+(num % m)}
end

```
1337 classes
To think about

```ruby

def leet_classes
 (0..1336).to_a.map do |n|
    class_name = 'Klass_' +n.to_s
    instance_method_return_value = 'i' + n.to_s 
    class_method_return_value = 'c' + n.to_s
    unique_instance_method_definition = %Q(def unique_instance_method ; "#{instance_method_return_value}" end)
    ele = Object.const_set(class_name, Class.new(Object))
    ele.define_singleton_method(:unique_class_method, lambda{class_method_return_value})
    ele.module_eval(unique_instance_method_definition)
    ele
  end
end

# other approcah 
def leet_classes
 (0..1336).to_a.map do |n|
    class_name = 'Klass_' +n.to_s
    instance_method_return_value = 'i' + n.to_s 
    class_method_return_value = 'c' + n.to_s
    unique_instance_method_definition = %Q(def unique_instance_method ; "#{instance_method_return_value}" end)
    ele = Object.const_set(class_name, Class.new(Object))
    ele.define_singleton_method(:unique_class_method, lambda{class_method_return_value})
    ele.module_eval(unique_instance_method_definition)
    ele
  end
end

# I think we good
def leet_classes
  (0..1336).to_a.map do |n|
    class_name = 'Klass_' +n.to_s
    class_definition = %Q(def unique_instance_method_#{n} ; "#{'i' + n.to_s}" end ; def self.unique_class_method_#{n} ; "#{'c' + n.to_s}" end)
    obj = Object.const_set(class_name, Class.new(Object))
    obj.class_eval(class_definition)
    obj
  end
end
```

Add _ - accessors to Hash

```ruby

class Hash
  def method_missing(name, argfunc = nil)
    if name.to_s.include?('=') 
      key_in_form_of_method= name.to_s[0..-2].gsub(/^_/, '').to_sym
      self[key_in_form_of_method] = argfunc
      return self[key_in_form_of_method]
    end

    key_in_form_of_symbol= name.to_s.gsub(/^_/, '').to_sym
    key_in_form_of_string= name.to_s.gsub(/^_/, '')
    if keys.include?(key_in_form_of_symbol) == false && keys.include?(key_in_form_of_string) == false
      self[key_in_form_of_symbol] = nil
      return self[key_in_form_of_symbol] 
    end

    if argfunc.nil?
      return self[key_in_form_of_symbol] unless self[key_in_form_of_symbol].nil?
      return self[key_in_form_of_string] unless self[key_in_form_of_string].nil?
    else
      self[key_in_form_of_symbol] = argfunc
      return self[key_in_form_of_symbol]
    end

  end
end


```

Fluent Calculator

Email validation

Split by hash keys

Kebabize

```ruby

def kebabize(str)
  str.gsub(/[0-9]/, '').gsub(/[A-Z]/){ ' '+ $&.downcase }.split(' ').join('-')
end

# Other good approaches
def kebabize(str)
  str.gsub(/([0-9])/, '').split(/(?=[A-Z])/).join('-').downcase
end

def kebabize(str)
  str.delete('^A-Za-z').split(/(?=[A-Z])/).join('-').downcase
end

```ruby

# Snail thinking

def snail(arr)
  arr.each{|e| puts e }
  res = []

  until arr.size === 1 
    premiere_ligne = arr.first
    arr.shift
    derniere_ligne = arr.last.reverse
    arr.pop
    ligne_droite =[]
    arr.each{|elt| ligne_droite << elt.last ; elt.pop }
    ligne_gauche = []
    arr.each{|elt| ligne_gauche << elt.first ; elt.shift }
    res << premiere_ligne << ligne_droite <<  derniere_ligne << ligne_gauche
    res = res.flatten
  end
  res += arr.flatten
  res
end

# Better I think and to improve
def snail(arr)
  turn = arr.size.even?
  res = []
  if turn 
    until arr.size == 2
      res <<  arr.first
      arr.shift
      arr.each{|e| res << e.last ; e.pop}
      res << arr.last.reverse
      arr.pop
      res << arr.map(&:first).reverse
      arr.each{|f| f.shift }
    end
    res << arr.first
    arr.shift
    res << arr.last.reverse
    arr.pop
    res = res.flatten
  else
    until arr.size == 1
      res <<  arr.first
      arr.shift
      arr.each{|e| res << e.last ; e.pop}
      res << arr.last.reverse
      arr.pop
      res << arr.map(&:first).reverse
      arr.each{|f| f.shift }
    end
    res << arr.last
    res = res.flatten
  end
  res
end

# Good approach

def snail(arr)
  turn = arr.size.even?
  res = []
  def snail_turn(res,arr,size)
    return nil if arr.size == size 
    res << arr.first
    arr.shift
    res << arr.map(&:last)
    arr.each(&:pop)
    res << arr.pop.reverse
    res << arr.map(&:first).reverse
    arr.each(&:shift)
    snail_turn(res,arr,size)
  end
  if turn 
    snail_turn(res,arr,2)
    res << arr.shift
    res << arr.pop.reverse
  else
    snail_turn(res,arr,1)
    res << arr.pop
  end
  res.flatten
end

# Peut être autre moyen de le faire par l'intermédiaire d'un tableau vide
# intérieur

# Suppression de deux lignes

def snail(arr)
  turn = arr.size.even?
  res = []
  def snail_turn(res,arr,size)
    return nil if arr.size == size 
    res << arr.shift
    res << arr.map(&:pop)
    res << arr.pop.reverse
    res << arr.map(&:first).reverse
    arr.each(&:shift)
    snail_turn(res,arr,size)
  end
  if turn 
    snail_turn(res,arr,2)
    res << arr.shift
    res << arr.pop.reverse
  else
    snail_turn(res,arr,1)
    res << arr.pop
  end
  res.flatten
end

```

Fluent Calculator


```ruby

$keeper=[]

class Fixnum
  def three 
    $keeper << '3'
    if $keeper.size == 2
      return self
    else
      res = $keeper.join
      result = eval(res)
      $keeper =[]
      $keeper << result
      result
    end
  end

  def one
    $keeper << '1'
    if $keeper.size == 2
      return self
    else
      res = $keeper.join
      result = eval(res)
      $keeper =[]
      $keeper << result
      result
    end
  end

  def plus
    $keeper << '+'
    if $keeper.size == 2
      return self
    else
      res = $keeper.join
      result = eval(res)
      $keeper =[]
      $keeper << result
      result
    end
  end
end

class Calc
  def one
    $keeper << '1'
    1
  end

  def three 
    $keeper << '3'
    3
  end
end

```

### Javascript

Javascript namespacing

https://www.codewars.com/kata/javascript-namespacing/train/javascript

```javascript

var MyNamespace = {
  MyClass:function(message){
    this.message = message ; 
    this.sayHello = function(){ return this.message ; };
  }
};

```

IP Validation

```javascript

function isValidIP(str){
  console.log(str)
  return (/^(\d{1,3}|\d+)(.|,)(\d{1,3}|\d+)(.|,)(\d{0,3}|\d+)(.|,)(\d+|\d{2})(.|,)(\d+|\d+)$/).test(str) 
}

```

Next bigger number with the same digits

Linked list to string

```javascript

function stringify(list) {
  console.log(list)
  if(list === null){return "null"}
  var datalist = []
  var i = list 
  for(;;){
    datalist.push(i.data)
    i = i.next
    if(i.next == null){
      datalist.push(i.data)
      datalist.push('null')
      break
    }
  }
  return datalist.join(' -> ')
}

```

A Chain adding function

https://www.codewars.com/kata/a-chain-adding-function/train/javascript

```javascript

function add(n){
  // Let the currying begin!
  return function(){
    var args = Array.prototype.slice.call(arguments,0);
    console.log(args);
    return 0;
  }
}


```

Flatten

https://www.codewars.com/kata/flatten/train/javascript

```

// create your flatten method here
function flatten(arr) {
  var result = [];
    for (var i = 0 ; i < 0 ; i++){
        if (i.length > 0){ result.push(flatten(i)); }
    }
    return result ; 
  }

```

Calculating with functions

https://www.codewars.com/kata/calculating-with-functions/train/javascript


DropWhile

https://www.codewars.com/kata/the-dropwhile-function/train/ruby

Hello Wait What

https://www.codewars.com/kata/hello-w-dot-dot-dot-wait-what/train/javascript

```javascript

var helloWorld = function () {
  return ((function(){ return (14)["toString"](16) })())
}

```

Argument mapper

https://www.codewars.com/kata/argument-mapper/train/javascript


Linked lists - Push & BuildOneTwoThree

https://www.codewars.com/kata/linked-lists-push-and-buildonetwothree/train/javascript

T Combinator

Pipelining and composing functions

Wrapped Functions

Range function

#### Good Katas to observe

[Linked lists](https://www.codewars.com/kata/linked-lists-insert-nth-node)

[Clockwise](https://www.codewars.com/kata/rotate-matrix-counter-clockwise-n-times)

[String tree ification](https://www.codewars.com/kata/string-tree-ification)

[Fun with tree](https://www.codewars.com/kata/fun-with-trees-is-perfect)

#### SQL

Group by

Function

### Python

```python

import functools as functools

def sum_cubes(n):
    arr =  list(map(lambda x : x*x*x , list(range(0,n+1))))
    return functools.reduce(lambda x,y : x+y, arr)

# other approaches in thinking
# Point interessant en python3 utilisation librairie externe functools

def sum_cubes(n):
    return functools.reduce(lambda x,y : x+y, [x*x*x for x in range(0,n+1)])

def sum_cubes(n):
    return functools.reduce(lambda x,y : x+y, (x*x*x for x in range(0,n+1)))


```

#### Snippets a Penser

```ruby
# encoding: UTF-8
class Class
  def mixin_ancestors(include_ancestors=true)
    ancestors.take_while {|a| include_ancestors || a != superclass }.
        select {|ancestor| ancestor.instance_of?(Module) }
  end
end
```
