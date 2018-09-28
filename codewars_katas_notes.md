Codewars notes
========

![Codewars](https://www.codewars.com/users/mosleymos/badges/micro)

## Resolu

### Python

Find thing first

```python

# Solution proposee
def solution(first,last):
    ''' Find a way to make this work without declaring any variables'''
    return (first(),last())[0]

# Approche que je trouve plus déclarative par rapport à un objectif
def solution(first, last):
    try:
        return first()
    finally:
        last()

# Approche courte
def solution(first,last):return next(x for x in(first(),last()))


def solution(*fs):
    return [f() for f in fs][0]


```

Detect Pangram

```python

import string

def is_pangram(s):
    return (len(set([i.lower() for i in list(s)])) >= 26)

```

Add Binary

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

Product of array items

```ruby
# Approche
def product(arr)
  arr.nil? ? nil : (arr.empty? ? nil : arr.reduce(:*))
end

# What version of ruby > 2.5
# safe navigation operator cf https://en.wikipedia.org/wiki/Safe_navigation_operator
def product(arr)
  arr&.reduce(:*)
end

# rescue to nil ou problème
def product(arr)
  arr.reduce(:*) rescue nil
end

def product(arr)
  return if arr.nil?
  arr.inject(:*)
end

def product(arr)
  arr.reduce(:*) unless arr.nil?
end

# Rapproche de la mienne
def product a
  (a.nil? or a.length == 0) ? nil : a.reduce(:*)
end
# Variante
def product a
  (a.nil? or a.length.zero?) ? nil : a.reduce(:*)
end

# insert inject sur 1
def product(arr)
  arr and arr.length > 0 ? arr.inject(1) { |prod, f| prod * f } : nil
end

```


Sum of triangular numbers

```ruby

# Garder réference au kata pyramid
def sum_triangular_number n
  return 0 if n<0
  res = []
  (n).times do |nb|
    if nb.zero?
      res << [1]
    else
      prev = res[-1][-1]
      res << ((prev+1)..(prev+nb+1)).to_a
    end
  end
  res.map(&:last).reduce(&:+)
end

# Refactor
def sum_triangular_numbers n
  n<0 ? 0 : (1..(n-1)).inject([1]){ |a,b| a << (a[-1]+b+1) }.reduce(&:+)
end

# Approches
def sum_triangular_numbers(n)
  n < 0 ? 0 : n * (n + 1) * (n + 2) / 6
end


def sum_triangular_numbers(n)
  n <= 0 ? 0 : n*(n+1)*(n+2)/6
end

def sum_triangular_numbers(number)
  (1..number).map { |n| n * (n + 1) / 2 }.sum
end

def sum_triangular_numbers(n)
    # your code here
    sum_ = Array.new
    for i in 1..n
      sum_.push(i*( i + 1 ) / 2)
    end

    return sum_.map(&:to_i).reduce(0, :+)
end

def sum_triangular_numbers(n)
  counter = 2
  number = 1
  arr = [1]
  while counter <= n do
    number += counter
    arr.push(number)
    counter += 1
  end
  n >= 0 ? arr.sum : 0
end

```

Isogram


```ruby
# Approche
def is_isogram s 
  res = false
  return true if s == ""
  s.downcase.chars.inject({}){|a,b|
    if a[b].nil?
      a[b] = 1 
      a
    else
      a[b] += 1
      a
    end
  }.each{|k,l|  
    if l>1
      res = false ; 
      break 
    else 
      res = true
    end
  }
  res
end


# Elegant

def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end

# Approche hash

def is_isogram(string)
  return true if string.length == 0
  string = string.downcase
  hash = Hash.new(0)
  string.chars.map{|x| hash[x] += 1}.max > 1 ? false : true
end

# Usage du Set
def is_isogram(string)
  string.length === Set.new(string.downcase.chars).length
end

# Raisonnement inverse
def is_isogram(str)
   ('a'..'z').none?{|l| str.downcase.count(l) > 1}
end

# Raisonnement boucle
def is_isogram(string)
  #your code here
  i = 0
  while i < string.length
    j = i + 1
    current = string[i]
      while j < string.length
        if current.downcase == string[j].downcase
          return false
        end
        j += 1
      end
    i += 1
  end
  return true
end
```

Count Odd Numbers below n

```ruby
# Ne pas s'amuser a creer le tableau et faire du un par un
def oddCount n 
   n.odd? ? ((n+1)/2) -1 : (n / 2)
end

# Autre approche
def oddCount(n)
  n / 2
end

def oddCount n 
  n.divmod(2)[0]
end

# exotique
def oddCount n
  n >> 1
end

# stepique
def oddCount n 
  (1...n).step(2).size
end

def oddCount n 
  (n/2)|0
end

def oddCount n 
  n % 2 == 1 ? (n-1)/2 : n/2
end
```

Last

```ruby
# Approche effectuee - peut etre trop complexe
class String
  def  last
    self.chars[-1]
  end
end

class Fixnum
  def last
    self
  end
end

def last(*n)
  n.map(&:last).last
end


# One liners
def last(*args)
  args[-1].is_a?(String) ? args[-1][-1] : args.flatten[-1]  
end

def last(*args)
  [String, Array].include?(args[-1].class) ? args[-1][-1] : args[-1]
end

def last(*input) 
  input[-1].is_a?(String) ? input[-1][-1] : input.flatten[-1]
end

def last(*args)
  a = args.flatten.last
  a.is_a?(String) ? a[-1] : a
end

# Longue solution

def last *ele
if ele.length > 1
eles=[]
ele.each do |e|
eles << e
end
return eles[eles.length-1]
  else
if ele.is_a?(Array)
# puts ele
  arr = ele.first
  if arr.to_s.length == 1
  return arr
  else
  return arr[arr.length-1]
  end
elsif ele.is_a?(String)
  eles=ele.first.split("")
  return eles[eles.length-1]
  end
  end
  end
# Autres approches

def last *args
  args.last.last
end

class Fixnum
  def last
    self
  end
end

class String
  def last
    self[-1]
  end
end


def last(*arg, arg_last)
  if arg.empty? && arg_last.respond_to?(:index) 
    arg_last[-1] 
  else
    arg_last
  end
end

```

Enumerable Magic #25 - Take the First N Elements

```ruby
def take list, n
  list.first n
end

def take list, n
  list.take(n)
end

def take list, n
  list[0...n] # retour de la liste
end

def take list, n
  list[0,n]
end

def take list, n
  # your solution here
  list - list.drop(n)
end

#Long
def take list, n
  newarr = []
  i = 0
  while i < n
    newarr.push(list[i])
    i += 1
  end
  if list.length == 0
  return []
  else
  return newarr
  end
end

def take list, n
  return list if list.length <= n
  r = []
  (1..n).each do |i|
    r << list[i-1]
  end
  r
end
```
Summation Of Primes

```ruby

require 'prime'
def sum_of_primes(n)
  (0..n).select(&:prime?).reduce(:+)
end

require 'prime'

def sum_of_primes(n)
  Prime.each(n).sum
end

# Variante
require 'prime'

def sum_of_primes(n)
  Prime.take_while{|m| m <=n}.sum
end

# Approche SIEVES
def sum_of_primes(n)
  sieve = (2..n)
    .lazy
    .reject {|x| x % 2 == 0 && x > 2}
    .reject {|x| x % 3 == 0 && x > 3}
    .reject {|x| x % 5 == 0 && x > 5}
    .reject {|x| x % 7 == 0 && x > 7}
    .to_a
  sum = 0
  while !sieve.empty?
    f = sieve.first
    m = f
    #puts "next prime = #{f}"
    sum += f
    while (f <= n) do
      #puts "deleting #{f}"
      sieve.delete(f)
      #puts "sieve now #{sieve}"
      f += m
    end
  end
  sum
end

def sum_of_primes(n)
  hash = {2 => 0}
  (2..n).each do |number|
    hash[number] = 0 unless number.even? # only add odd numbers
  end
  p = 3
  while p**2 <= n
    hash.each_pair do |number, value| 
      if number % p === 0 # p is a factor of n, remove it
        hash.delete(number) unless number === p
      end
    end
    p += 2 # only try odd numbers
  end
  hash.keys.sum
end

# Approche compute
$d = [2,3,5,7]

def sum_of_primes(n)
  return $d.take_while{|x| x <= n}.sum if $d[-1] >= n
  m = $d[-1] + 1
  while $d[-1] < n do
    $d << m if $d.all?{|x| m % x != 0}
    m += 1
  end
  sum_of_primes(n)
end
```
Form the largest 

```ruby

def max_number(n)
  n.to_s.chars.sort{|a,b| b<=>a }.join.to_i
end

# Better
def max_number(n)
  n.to_s.chars.sort.reverse.join.to_i
end

# Connaissait pas
# Fixnum#digits -> depend version ruby
def max_number(n)
  n.digits.sort_by(&:-@).join.to_i
end

# Approche longue
def max_number(n)
  #your code here
  s = n.to_s
  s = s.split("")
  ok  = []
  for i in 0..s.length-1
    ok.push s.max
    for i in 0..s.length-1
      if s[i] == s.max
        s.delete_at(i)
         break
       end 
    end
    
  end
  ok  = ok.join("")
  ok = ok.to_i
  return ok
end

```
Form the minimum

```ruby

def min_value(digits)
  digits.uniq.sort.join.to_i
end

# Variante
def min_value(digits)
  digits.uniq.sort!.join.to_i
end

# Complexe mais coup d'oeil
class Proc
  # compose for lambdas
  def *(f)
    ->(*args) { self.(f.(*args)) }
  end
end

def min_value(digits)
  toHash = -> (digits) { digits.reduce({}) { |acc, n| (acc[n] = n) && acc} }
  toNumbers = -> (hash) { (1..9).to_a.map{ |n| hash[n] } }
  toNumber = -> (numbers) { numbers.join('').to_i }
  
  compose = toNumber * toNumbers * toHash
  compose.(digits)
end


# Autre complexe
def min_value(digits)

  accum = 0
  
  while !digits.empty?() do
  
    # find the lowest number
    lowest = digits.inject do |memo, n|
      if n < memo || memo == 0
        n
      else
        memo
      end
    end
    
    # Put it in an accumulator
    accum = accum * 10 + lowest
    
    # remove it from the array
    digits.delete(lowest)
    
  end
  
  return accum
  
end
```

Sort by last char

```ruby
def last(x)
  x.split(/\s/).sort_by{|w|w[w.length-1]}
end

# approches similaires

def last(x)
  x.split(" ").sort_by{|w|w[-1]}
end

# split naturel sur les espaces
def last(x)
  x.split.sort_by{|w| w[-1]}
end

```

Quick (n choose k) calculator

cf [Combination](https://en.wikipedia.org/wiki/Combination)

```ruby
# approche math
def choose(n,k)
  ((n-(k-1))..n).reduce(&:*) / (1..k).reduce(&:*)
end

# Alter
def choose(n,k)
  (1 + n - k..n).reduce(:*) / (1..k).reduce(:*)
end

# Approche surcharge ??
class Numeric
  def !
    self == 0 ? 1 : (1..self).reduce(:*)
  end
end

def choose(n,k)
  return 0 if n < k
  n.! / (k.! * (n-k).!)
end

# Recursive
def choose n, k
  k == 0 ? 1 : choose(n - 1, k - 1) * n / k
end

# clever
def choose(n,k)
  (1..n).to_a.combination(k).size
end

```

RGB to Hex conversion

```ruby
# a ameliorer
def rgb(r, g, b)
	[r,g,b].map{|e| 
      if e == 0
        "00"
      elsif e < 0
        "00"
      elsif e > 255 
        255.to_s(16).upcase
      else
        e.to_s(16).upcase
      end
	}.join
end

```

Inverting a hash

```ruby

def invert_hash(hash)
  hash.map{|k,v| {v => k} }.reduce{|a,b| a.merge(b) }
end

```

Roman numbers

```ruby

def solution(roman_number)
  roman_number_hash = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'C' => 100,
    'M' => 1000,
    'L' => 50,
    'D' => 500
  }
  previous = ''
  roman_number.chars.reverse.map do |letter|
    if /X|V/.match(previous) && letter == 'I'
      previous =''
      -1
    else
      previous = letter
      roman_number_hash[letter]
    end
  end.reduce(&:+)
end

# Approche simplifiée
ROMAN = {
  'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100,
  'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10,
  'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1
}

def solution(roman)
  re = Regexp.new(ROMAN.keys.join('|'))
  roman.scan(re).inject(0) do |number, key|
    number + ROMAN[key]
  end
end

def solution(roman)
  vals = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
  roman.chars.map{|c| vals[c]}.reduce{|a, b| a < b ? b - a : a + b}
end


```

Count chars

```ruby
def count_chars(s)
  s.chars.uniq.each_with_object({}) { |c, h| h[c] = s.count(c) }
end

def count_chars(s)
  count = Hash.new(0)
  s.to_s.split('').map{|el| count[el] += 1}
  count
end

```

Array and procs #1

```ruby

def array_procs(*args)
  to_change = args.first
  args[1..-1].each do |some_proc|
    to_change = to_change.map(&some_proc)
  end
  to_change
end

```

is_anagram

```ruby

def is_anagram(test, original)
  test.downcase.chars.sort == original.downcase.chars.sort ? true : false
end

# autres approches

# meilleur
def is_anagram(test, original)
  test.downcase.chars.sort == original.downcase.chars.sort
end

# plusieurs !!
def is_anagram(*texts)
  texts.map { |t| t.downcase.chars.sort }.reduce(:==)
end

```

Sorted? yes? no? how?

```ruby

def is_sorted_and_how(arr)
  return 'yes, ascending' if arr.each_cons(2).map{|e| e.first < e.last }.flatten.all?
  return 'yes, descending' if arr.each_cons(2).map{|e| e.first > e.last }.flatten.all?
  return "no"
end

# Autre approche
# Better
def is_sorted_and_how(arr)
  arr == arr.sort ? 'yes, ascending' : arr== arr.sort.reverse ? 'yes, descending' : 'no'
end


def is_sorted_and_how(arr)
	return "yes, ascending"  if arr == arr.sort
	return "yes, descending" if arr == arr.sort.reverse
	"no"
end

```

5 without numbers !!

```ruby

def unusual_five()
  nil.to_i.next.next.next.next.next
end

# autre

def unusual_five
  ''.ord
end

def unusual_five()
  'five!'.length
end

def unusual_five()
  return ['f','u','c','k','u'].length
end

def unusual_five()
  'F'.hex.modulo 'A'.hex
end

```

Difference of squares

```ruby

def difference_of_squares(n)
  (((1..n).reduce(&:+))**2) - ((1..n).map{|x| x**2}.reduce(&:+))
end

# other approach

def difference_of_squares(x)
  r = 1..x
  r.inject(:+) ** 2 - r.map{|x| x ** 2 }.inject(:+)
end

```

Metaprogramming Conjurer

```ruby
class Conjurer
  def self.conjure(method_name, method_definition)
    define_method(method_name, method_definition)
  end
end

# otres approches
class Conjurer
  class << self
    def conjure(name, impl)
      define_method(name, &impl)
    end
  end
end

class Conjurer
  def self.conjure(method, block)
    self.send(:define_method, method, block)
  end
end

class Conjurer
  class << self
    def conjure(name, block)
      define_method name do
        block.call
      end
    end
  end
end

```

Not prime Numbers

```ruby
# Approche
require 'prime'
def not_primes(a,b)
  ((a)...(b)).lazy.reject(&:prime?).map(&:to_s).select{|n| n =~ /^[2357]*$/
  }.map(&:to_i).to_a
end

# Variation de l'approche
require 'prime'
def not_primes(a,b)
  (a...b).reject(&:prime?).select do |n|
    n.to_s.match? /^[2357]+$/
  end
end

```

Sum nested

```ruby

def sum_nested(lst)
  lst.flatten.reduce(&:+).to_i
end

# Better
def sum_nested(lst)
  lst.flatten.reduce(0, :+)
end

```

Count characters in your string


```ruby

def count_chars(s)
  s.split('').reduce({}){|acc,n| acc[n.to_s] = acc[n.to_s].to_i + 1 ; acc}
end

# autre approches

def count_chars(s)
  s.chars.group_by(&:itself).map { |k, v| [k, v.size] }.to_h
end

def count_chars(s)
  (s.chars.uniq.zip s.chars.uniq.map {|a| s.count(a)}).to_h
end

def count_chars(s)
 Hash[s.chars.uniq.zip s.chars.uniq.map {|a| s.count(a)}]
end

def count_chars(s)
  s.each_char.each_with_object(Hash.new(0)){ |c, h| h[c] += 1 }
end


```

Find the odd Int


```ruby

def find_it(seq)
  seq.group_by{|n| n }.select{|k,v| v.count.odd?}.keys.first
end

# autre approche

def find_it(seq)
  seq.detect { |n| seq.count(n).odd? }
end

# meta comme solution
def find_it(seq)
  seq.reduce(:^)
end

def find_it(seq)
  seq.find{|c| seq.count(c).odd? }
end

def find_it(seq)
  seq.uniq.map { |number|return number if seq.count(number).odd? }
end

# Metal comme solution
def find_it(seq)
  seq.reduce({}){|acc, n| acc[n.to_s] = acc[n.to_s].to_i + 1; acc}.find{|k,v| v.odd?}.first.to_i
end

def find_it(seq)
  seq.each {|x| seq.count(x)%2==1 ? (return(x)) : ()}
end

```

Merge array

```ruby

require 'set'

def merge_arrays(arr1, arr2)
  SortedSet.new(arr1).merge(arr2).to_a
end

```

Next Prime


```ruby

require 'prime'

def next_prime(n)
  n+=1
  Prime.prime?(n) ? n : next_prime(n)
end

# autres approches

require 'prime'

def next_prime(n)
  (n + 1).step { |i| return i if i.prime? }
end


require 'prime'

def next_prime(n)
  (n + 1).step.find(&:prime?)
end

require "prime"
def next_prime(x)
 (x+1).step{|y| return y if y.prime?}
end

require 'prime'

def next_prime(n)
  (n+1..Float::INFINITY).find{ |x| Prime.prime?(x) }
end

```

Backward Primes


```ruby

# Solution sans le Prime class

def backwardsPrime(start, stop)
  (start..stop).select { |n| backwards_prime?(n) }
               .sort!
end

def backwards_prime?(n)
  reverse_n = n.to_s.reverse.to_i
  n != reverse_n   &&   prime?(n) && prime?(reverse_n)
end

def prime?(n)
  max = Math.sqrt(n).floor
  (2..max).all? { |i| n % i != 0 }
end

# Otre approche plus interressante

def backwardsPrime(start, stop)
  (start..stop).select { |n| backwards_prime?(n) }
end

def prime?(num)
  num <= 1 ? false : (2..Math.sqrt(num).floor).none? { |n| num % n == 0 }
end

def backwards_prime?(num)
  return false unless prime?(num)
  backwards = num.to_s.reverse.to_i
  backwards != num && prime?(backwards)
end

# Soluce qui se rapproche de celle avec prime
def backwardsPrime(x, y)
  primes = (x..y).to_a.select {|j|  j.to_s.reverse.to_i != j && (2..j/2).none?{|i| j % i == 0 }}
  primes.select{|j| (2..j.to_s.reverse.to_i/2).none?{|i| j.to_s.reverse.to_i % i == 0 }}
end
# Solution possible avec le prime

def backwardsPrime(start, stop)
  require 'prime'
  (start..stop).select{|number| number.prime? && number.to_s.reverse.to_i.prime?     && number.to_s != number.to_s.reverse }
end

# ou

def backwardsPrime(start, stop)
  (start..stop).select { |n| n.prime? && n.to_s.reverse.to_i.prime? && n != n.to_s.reverse.to_i }
end

## funny

def is_prime(num)
  return false if [-1,0,1].include?(num)
  (2..(num**0.5).to_i).select{|i| i != num and num%i == 0}.size == 0
end

def backwardsPrime(start, stop)
  (start..stop).select do |n|
    if is_prime(n)
      rn = n.to_s.reverse.to_i
      rn != n and is_prime(rn)
    end
  end
end

```

Array and procs #1

```ruby

def array_procs(*args)
	to_change = args.first
	args[1..-1].each do |some_proc|
    to_change = to_change.map(&some_proc)
	end
	to_change
end

# Autres approches

def array_procs(arr, *procs)
  procs.inject(arr){ |a, p| a.map(&p) }
end

def array_procs(arr, *procs)
  procs.each{|p| arr = arr.map(&p) }
  arr
end

def array_procs(array, *procs)
  result = []
  procs.each do |proc|
    result = array.map(&proc)
    array  = result
  end
  array
end


def array_procs(arr, *procs)
  arr.map { |i| procs.reduce(i) { |x, proc| proc === x } }
end

def array_procs(array, *procs)
  array.map { |element| procs.inject(element) { |memo, proc| proc[memo] } }
end

def array_procs(arr, *procs)
  procs.size.times{|y| arr = arr.map{|x| procs[y][x]}}
  arr
end

class Proc
  def +(other)
    ->(x) { other[self[x]] }
  end

  def self.id
    ->(x) { x }
  end
end

def array_procs(arr, *procs)
  arr.map { |e| procs.inject(Proc.id, &:+)[e] }
end

def array_procs(arr, *procs)
  arr.collect {|x| procs.inject(x) {|a,p| p[a]}}
end
```

flattened_keys

```ruby
# Premiere solution a l'esprit
# A améliorer
class Hash

  def flattened_keys

    def flat hash
      h = {}
      hash.each do |k,v|
        if v.is_a? Hash
          keys_to_remove = hash[k].keys
          keys_to_remove.each do |cle|
            if (cle.is_a?(String) || k.is_a?(String))
              h[[k.to_s,cle.to_s].join('_')] = hash[k][cle]
            else
              h[[k.to_s,cle.to_s].join('_').to_sym] = hash[k][cle]
            end
          end
          h = flat h
        else
          h[k] = v
        end
      end
      return h
    end

    simple_hash = self
    flat simple_hash

  end
end

```

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

Count positive/Sum of negatives

```ruby
def count_positives_sum_negatives(lst)
  total_positive = lst.select{|nb| nb > 0}
  total_negative = lst.select{|nb| nb < 0}
  [total_positive.size, total_negative.empty? ? 0 : total_negative.reduce(&:+) ]
end

# Better
def count_positives_sum_negatives(lst)
    [lst.count{|n| n > 0}, lst.select{|n| n < 0}.reduce(0, :+)]
end

# What ???
def count_positives_sum_negatives(lst)
  return [] if lst.nil? || lst.empty?
  [lst.count(&:positive?), lst.select(&:negative?).reduce(0, :+)]
end

# Wh..
def count_positives_sum_negatives(list)
  [list.count(&:positive?), list.select(&:negative?).reduce(0,:+)]
end

```



Square(n) Sum

```ruby

def squareSum(numbers)
  numbers.map{|n| n*n }.reduce(&:+)
end

```

convert hash to array

```ruby

def convert_hash_to_array(hash)
  new_hash = Hash[hash.collect{|k,v| [k.to_s, v]}]
  new_hash.to_a
end

def convert_hash_to_array(hash)
  Hash[hash.collect{|k,v| [k.to_s, v]}].to_a
end

def convert_hash_to_array(hash)
  hash.map{ |k, v| [k.to_s, v] }
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

Power

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

```

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

Odd Not prime

```ruby

require 'prime'
def odd_not_prime(num)
  (1..num).reject(&:even?).reject(&:prime?).length
end

# autre approche
require 'prime'

def odd_not_prime(num)
   (num+1)/2-Prime.each(num).select{|x| x%2 != 0}.length
end

require 'prime'

def odd_not_prime(num)
  (1..num).count{ |x| x.odd? && !Prime.prime?(x) }
end
```

leet classes (approach)

```ruby
def leet_classes
  (1..1337).to_a.map do |i|
    Object.const_set("FooBar_#{i}", Class.new {
      define_singleton_method("class_method_#{i}") { "class_method_value_#{i}" }
      define_method("instance_method_#{i}") { "instance_method_value_#{i}" }
    })
  end
end
```

### javascript

Combine

```javascript
// Approche first
const uniq = function(item, i, ar){ return ar.indexOf(item) === i; }

const mergeObj = (a,b) => {
  var res = {}
  var arr_a = Object.keys(a)
  var arr_b = Object.keys(b)
  var some = [...arr_a, ...arr_b].filter(uniq).forEach(k=>{
    var left = a && a[k] || 0
    var right = b && b[k] || 0
    res[k] = left  +  right
  })
  return res
}

const combine = (...args) => {
  return args.reduce(mergeObj)
}

```

Remove all the marked elements of a list

```javascript

Array.prototype.remove_ = (integer_list, values_list) => integer_list.reduce((a,b)=> values_list.includes(b) ? a : a.concat(b) , [])


Array.prototype.remove_ = function(integer_list, values_list){
  return integer_list.filter(function (element) {
    return values_list.indexOf(element) === -1;
  });
}

Array.prototype.remove_ = (integer_list, values_list) => integer_list.filter(v => values_list.indexOf(v) == -1);

Object.defineProperty( Array.prototype, "remove_", { value: (xs,ys) => xs.filter( x => ! ys.includes(x) ) } );

Array.prototype.remove_ = (a, b) => a.filter(x => b.indexOf(x) < 0)


Array.prototype.remove_ = function(ints, remove) {
  ints = ints.slice();
  for (let i = 0; i < ints.length; i++) {
    if (remove.includes(ints[i])) {
      ints.splice(i,1)
      i--
    }
  }
  return ints
}

Array.prototype.remove_ = function(integer_list, values_list){
  var arr=[];
  for (var i=0; i<integer_list.length; ++i)
  {
    var count=0;
    for (var j=0; j<values_list.length; ++j)
      if (values_list[j]==integer_list[i])
        count++;
    if (count==0)
      arr.push(integer_list[i]);
  }
  return arr;
}

Array.prototype.remove_ = function(integer_list, values_list){
   return integer_list.filter(value => !values_list.includes(value));
};

// Solution longue
Array.prototype.remove_ = function(a, b){
    var ret = [];
    if (!(Array.isArray(a) && Array.isArray(b))) {
        return ret;
    }
    var i;

    for (i = 0;  i< a.length; i++) {
    // if element in array A  isn't in array B push that element to new array    
         if (-1 === b.indexOf(a[i])) {
           ret.push(a[i]);
      }
    }
    return ret;
}

```

You only need one - Beginner

```javascript
const check = (arr, x) => arr.includes(x);

const check = (array, value) => !!~array.indexOf(value);

const check = (a,x) => a.some(item => item === x);

function check(a,x){return a.findIndex(k => k == x) != -1};

const check = (a,x) => {
  const el = a.find(el => el === x);
  return el === x ? true : false;
}

const check = (a, x) => a.filter( w => w === x ).length ? true : false 


function check(a,x){
  var ans = a.indexOf(x)
  if (ans == -1) {
    return false
  }
  return true
};


/*
(5) Use ES2015 method to see if array contains the value.
    Eliminate more cruft.
*/
  const check = (a,x)=>a.includes(x)




/*
  (4) Eliminate all the overhead setup.
      Use the ES2015 SOME method to see if one or more
      of the array entries matches our target.
      Written in the form of a lambda (arrow function) to make it streamlined
    
    const check = (a,x)=>a.some(v=>v==x)
*/

/*
(3) Filter the Array
    Reduce it down to matching values or an empty set ... [66]
    Test the length of the array   [66].length > 0

  function check(a,x){
    return (a.filter(v=>v==x)).length > 0
  }
*/

/*
(2) Walk the array without ability to break the loop.
    Create a variable to hold the state of our match.
    Check if the target is found and return the findings

  function check(a,x){
    let foundTarget = false
    a.forEach((v,i,A)=>{
      if (v==x){ foundTarget = true}
    })
    return foundTarget
  }
*/


/*
  (1) Manually Walk the array, 
    Break out of the loop (return true) if you find a match
    otherwise return false

  function check(a,x){
    for (let i=0; i<a.length;i++){
      console.log(a[i])
      if (a[i]==x){ return true }
    }
    return false
  }
*/



```

Opposites Attract

```javascript

const lovefunc = (flower1, flower2) => (flower1+flower2) %2 ==0 ? false : true 

```

Array.prototype.reverse() 

```javascript
// ce reverse est destructif
Array.prototype.reverse = function(){
  console.log(this)
  var reversedArray =  this.reduceRight(function(a,b){
    return a.concat(b)
  },[])
  this.forEach((element, index, array)=>{ this[index] = reversedArray[index] })
  return this
};

// Autre approche
Array.prototype.reverse = function() {
  for(var i = 0, j = this.length-1; i < j; i++, j--) {
    var tmp = this[i];
    this[i] = this[j];
    this[j] = tmp;
  }
  return this;
};

// Usage du slice non prévu
Array.prototype.reverse = function() {
  var copy = this.slice(0);
  return this.forEach(function(el, i){ this[i] = copy.pop();}, this), this;
};

// Usage stack
Array.prototype.reverse = function() {
  for (var l = this.length - 2; l > -1; --l) {
    this.push(this[l]),
    this.splice(l, 1);
  }
  return this;
};

// Hacky
Array.prototype.reverse = require('vm').runInNewContext('Array.prototype.reverse');

// Return
Array.prototype.reverse = function() {
  for (var i = 0; i < this.length / 2; i++) {
    [this[i], this[this.length - i - 1]] = [this[this.length - i - 1], this[i]];
  }
  return this;
};

// Usage du Unshift
Array.prototype.reverse = function() {
  var len = this.length;
  for (var i = 0; i < len; i++){
    this.unshift(this.splice(i, 1)[0]);
  }
  return this;
};

// Simple
Array.prototype.reverse = function() {
  for(let i = 0; i < this.length; i++) {
    this.splice(i, 0, this.pop());
  }
  return this;
};

// Math
Array.prototype.reverse = function() {
   for (var i = 0; i < Math.floor(this.length/2); i++) {
     [this[i], this[this.length-i-1]] = [this[this.length-i-1], this[i]]
   }
   return this;
};
```

Anonymous return

Usage des closures en javascript
```javascript

name = 'The Window';

var alpha = {
    name : 'My Alpha',
    getNameFunc : function() {
        var name = this.name
        return function() {
            return name;
        };
    }
};

// Approche self - sympa à lire
name = 'The Window';

var alpha = {
    name : 'My Alpha',
    getNameFunc : function(){
      var self = this;
      return function(){
        return self.name;
      };
    }
};


// approche bind sur la fin
name = 'The Window';
var alpha = {
  name : 'My Alpha',
  getNameFunc : function() {
    return function() {
      return this.name;
    }.bind(this)
  }
};

// that better than this
name = 'The Window';

var alpha = {
    name : 'My Alpha',
    getNameFunc : function() {
        var that = this; 
        return function(){
            return that.name;
        };
    }
};
```

Splicing

```javascript
// Approche
Array.prototype.removeValue = function(thing) {
    return this.includes(thing) ? this.map((elt)=> elt === thing ? 're' : elt  )
               .reduce((a,b)=> b === 're' ? a : a.concat(b),[]) : false
}

// Autres approches
Array.prototype.removeValue = function(thing) {
   if (this.indexOf(thing) == -1) return false;
   var i ;
   while ((i = this.indexOf(thing)) > -1) this.splice(i,1);
   return this;
}


Array.prototype.removeValue = function(thing) {
  var removed = false, i
  for (i = 0; i < this.length; i++) {
    if (this[i] === thing) {
      this.splice(i, 1);
      i--;
      removed = true;
    }
  }
  return (this.length && removed ? this : false);
}

Array.prototype.removeValue = function(thing) {
    //TODO
    if(this.indexOf(thing) === -1) return false;
    var i;
    while(( i = this.indexOf(thing)) > -1) {
      this.splice(i, 1);
    }
    return this;
}

Array.prototype.removeValue = function(thing) {
    var hit = false;
    for (var i = this.length - 1; i > -1; i--) {
        if (this[i] === thing) {
            this.splice(i, 1);
            hit = true;
        }
    }
    return this.length && hit ? this : false;
}

Array.prototype.removeValue = function(thing) {
  const size = this.length;
  for (let i = this.length - 1; i >= 0; i--)
    if (this[i] === thing) this.splice(i, 1);
  return this.length < size && this;
}

// Hacky
const {filter} = require("lodash");
Array.prototype.removeValue = function(thing) { 
    if (!this.length || !this.some(v => v === thing)) { return false; /* ????????????????? */ }
    this.splice(0, "why the fuck would you do this using splice");
    return filter(this, v => v !== thing);
}

Array.prototype.removeValue = function (thing) {
  if (this.indexOf(thing) === -1)
    return false
  
  for (let i = 0, n = this.length; i < n; i++) {
    if (this[i] === thing) {
      this.splice(i, 1)
      i--
      n--
    }
  }
  return this
}

Array.prototype.removeValue = function(thing) {
  if (this.length < 1 || !this.includes(thing)) return false;
  var result = [];
  this.map(function(x) {
    if (x!==thing) result.push(x);
  });
  return result;
}
```

Find the capitals


```javascript
// approche
const capital = (capitals) => capitals.reduce((a,b)=> b.state ? a.concat(`The capital of ${b.state} is ${b.capital}`) : a.concat(`The capital of ${b.country} is ${b.capital}`) ,[])

//Better mais do it in new javascript version
function capital(capitals) {
  return capitals.map(function(e) {
    return 'The capital of ' + (e.state || e.country) + ' is ' + e.capital
  })
}
// new new syntax 

const capital = (capitals) => 
   capitals.map((e) => `The capital of ${(e.state || e.country)} is  ${e.capital}`)

// Use object js
function capital(capitals){
  return capitals.map(function (hash) {
    return Object.keys(hash).reduce(function (a, b) {
      return 'The capital of ' + hash[a] + ' is ' + hash[b] 
    })
  })
}

function capital(capitals){
   var returnArr = [];
  
    for (var i = 0; i < capitals.length; i++) {
         
         var str = 'The capital of '
             + (capitals[i].state || capitals[i].country)
             + ' is '
             + capitals[i].capital;
        
        returnArr.push(str);
    }
  
    return returnArr;
}

```
Once

```javascript
// Approche perso
const once = (fn) => {
  var i = 0
    return (...args) => {
      if(i<1){
        i+=1
        return fn.apply(this,args)
      }else{
        return ;
      }
   }
}

// Solution plus generique - use mot cle arguments
function once(fn) {
  var call = true
    return function() {
      if (call) {
        call = false
          return fn.apply(this, arguments)
      }
    }
}

function once(fn) {
    'use strict';

    return function () {
      if (!fn.ranOnce) {
         fn.ranOnce = true;
         return fn.apply(fn, arguments);
      }
    };
}

// approche try
function once(fn) {
  return function() {
    try {
      return fn && fn.apply(this, arguments);
    } finally {
      fn = undefined;
    }
  };
}

// Cryptique
function once(fn) {
  return function F(){
    var args = [].slice.call(arguments);
    return F.i ? [][[]] : (F.i = 1, fn.apply(null, args));
  };
}

function once(fn) {
  let k=true;
  return (...a)=>k&&(k=undefined,fn(...a))
}

const once = fn => {
    let done = false;
    return (...args) => {
        if (!done) {
            done = true;
            return fn(...args);
        }
    };
}

// Usage de Proxy

function once(fn) {
    let wasCalled = false;
    return new Proxy(fn, {
        apply(origFn, _, args) {
            if (wasCalled) return;
            wasCalled = true;
            return origFn(...args);

        }
    });
}

function once(fn) {
  let called = false;
  return function(...arguments) {
    if (!called) {
      called = true;
      return fn.call(null, ...arguments)
    }
  };
}
```

Fibonacci generator

```javascript

// Solution proposée

const fibonacci = (n) => {
  return n < 1 ? 0
    : n <= 2 ? 1
    : fibonacci(n - 1) + fibonacci(n - 2);
}

const genfib = () => {
  var i = 0
  return () => {
    return fibonacci(i++)
  }
}

// autre approche
function genfib(){
  var fibs = [0,1];
  return function fib(){
    fibs.push(fibs[0]+fibs[1]);
    return fibs.shift();
  }
}


function genfib(){
   var a = -1, b = 1;
   return function fib(){
      b = a + b;
      a = b - a;
      return b;
   };
}

function genfib(){
  var a = 0, b = 1;
  return function fib(){
    var ans = a;
    [a, b] = [b, a + b];
    return ans;
  }
}

function genfib() {
  var a = [0, 1], i = 0;
  return function fib() {
    a.push(a[i++] + a[i]);
    return a[i - 1];
  }
}

// Approche avec generateur
function *fibonacci(current = 0, next = 1) {
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}
 
function genfib() {
  const sequence = fibonacci();
  
  return function fib() {
    return sequence.next().value;
  }
}

// Approche la plus simple

function genfib(){
  let a = 0,
      b = 1

  return function fib(){
    let t = a
    a = b
    b += t

    return t
  }
}

// Clever
function genfib(){
  var a = 1, b = 0;
  
  return function() {
    return a = [b, b = a + b][0];
  };
}
```

Flatten

```javascript
// approche reprise sur un flatten sur 1
const flatten = arr => arr.reduce((a, v) => a.concat(v), []);

// Autres approches
var flatten = function (lol){
  return [].concat.apply([],lol);
}

var flatten = function (array){
  return array.reduce(function(a,z) {
    return a.concat(z);
  }, []);
}

// Plus détaillée
var flatten = function (array){
  var res = [];
  
  for (var i = 0; i < array.length; i++) {
    if (array[i] instanceof Array) {
      for (var j = 0; j < array[i].length; j++)
        res.push(array[i][j]);
    } else {
      res.push(array[i]);
    }
  }
  
  return res;
}

// flatten
var flatten = function (array){
let [...rest] = array;
  return [].concat(...rest);
}
```

How many smaller than me

```javascript

function smaller(nums) {
  res = []
  while(nums.length !== 0){
    nb = nums.shift()
    nb_inf =nums.filter(a=>a<nb).length
    res.push(nb_inf)
  }
  return res
}

```

XoR

```javascript

const xor = (a, b) => (a || b) && (!a || !b)

```

Fix String case

```javascript
function solve(s){
  String.prototype.map = Array.prototype.map
  var regexUppers = /[A-Z]/
  var regexLowers = /[a-z]/
  var nbUppers = s.split('').filter(e=>regexUppers.test(e))
  var nbLowers = s.split('').filter(e=>regexLowers.test(e))
  return nbLowers.length < nbUppers.length ? s.map(e=>e.toUpperCase()).join('') : s.map(e=>e.toLowerCase()).join('')
}

```

Coding Meetup #5 - Higher-Order Functions Series - Prepare the count of languages

```javascript

function countLanguages(list) {
  var res = {}
  list.forEach(function(a){
    if(res[a.language]){
       res[a.language]+=1
    }else{
        res[a.language]=1
    }
  })
  return res
}

```

Coding Meetup #3 - Higher-Order Functions Series - Is Ruby coming?

```javascript

function isRubyComing(list) {
  return list.filter(function(dev){ return dev.language === "Ruby" }).length > 0
 }

```

Ones and Zeros

```
// Stack overflow sur le sujet https://stackoverflow.com/questions/11103487/convert-binary-representation-of-number-from-string-to-int-javascript
// ex [0,0,0,1] -> 1
const binaryArrayToNumber = arr => parseInt(arr.join(""),2)

// Autres approches

function binaryArrayToNumber(arr) {
  return arr.reduce( (a, b) => a << 1 | b );
}

const binaryArrayToNumber = arr => {
  var num = 0;
  for (var i = 0, exponent = 3; i < arr.length; i++) {
    if (arr[i]) {
      num += Math.pow(2, exponent);
    }
    exponent--;
  }
  return num;
};
```

Life path number

```javascript
// Approche simple - opti a faire ??

function lifePathNumber(dateOfBirth) {
	function calculate(n){
    res =String(n.split('').map(e=>Number(e)).reduce((a,b)=>a+b))
    return res.length === 1 ? (res) : calculate(res)
  }
  return Number(calculate(dateOfBirth.split('-').map(e=>calculate(e)).reduce((a,b)=>a+b)))
}
```

Maximum Gap (Array Series)


```javascript
const maxGap = arr => {
  var max = 0
    arr.sort((d,e)=> d-e).reduce((a,b)=>{
        if(b-a > max){
          max = b-a
          return b
        }else{
          return b
        }
     })
  return max
}

```

Every possible sum of two digits

```javascript
// Approche en cours
function digits(num){
  var ar = String(num).split('').map(e=>Number(e))
	var res = []
  while(ar.length !== 1){
    var to_compute = ar.shift()
    res.push(ar.map(elt=> elt+to_compute))
  }
  return res.reduce((a,b)=>a.concat(b),[])
}

```
Count beads

```javascript

const countRedBeads = (n) => (n == 0 || n == 1 ) ? 0 : (n*2) -2

// Variable nom plus explicite
function countRedBeads(num_blue) {
  return (num_blue >= 2) ? (num_blue-1)*2 : 0;
}

```

Coding Meetup #2 - Higher-Order Functions Series - Greet developers

```javascript
function greetDevelopers(list) {
  return list.map(function(dev){
      dev.greeting = `Hi ${dev.firstName}, what do you like the most about
      ${dev.language}?`
          return dev
      })
}

```
Min Heap

```javascript
var MinHeap = function(){
	this.stack = []
	this.push = function(v){
    this.stack.push(v)
  }
  this.pop = function(){
    var to_pop = this.stack.sort((a,b)=> b-a)
    return to_pop.pop()
  }
}

```

Remove consecutive duplicative words

```javascript
// Approche
const removeConsecutiveDuplicates = (s) => {
 var previous =''
 var right = (a) =>{ previous = a ; return a }
 var left = (b) =>{ previous = b ; return 'undefined'  }
 return s.split(' ').map(a => previous ===a ? left(a) : right(a)  ).filter((e) => e !=='undefined').join(' ')
}

// Oneliner
const removeConsecutiveDuplicates = s => s.split(" ").filter((x,i,arr) => x!=arr[i-1]).join(" ");

const removeConsecutiveDuplicates = s => s.replace(/(\b\w+)( \1\b)+/g, (_, word) => word);

const removeConsecutiveDuplicates = s => s.replace(/(\b\w+)( \1\b)+/g, '$1');

const removeConsecutiveDuplicates = s => s.split(' ').filter((e, i, a)=>{
  return e !== a[i+1];
}).join(' ');

const removeConsecutiveDuplicates = s => s.replace( /\b(\S+)\s+(?=\1\b)/g, "" ) 

// Meilleure presentation
const removeConsecutiveDuplicates = s => s.split(' ')
                                          .map((_,i,arr) => (arr[i] === arr[i+1]) ? 0 : arr[i])
                                          .filter(x => x !== 0)
                                          .join(' ')
```

Calculate average

```javascript
const find_average = array =>  array.reduce((a,b)=>a+b,0) / array.length

```
Find needle in a haystack

```javascript
const findNeedle = haystack =>  'found the needle at position ' + haystack.indexOf("needle")

// Autre approche
const findNeedle = haystack => `found the needle at position ${haystack.indexOf('needle')}`;

```
Are the numbers in order?

```javascript
const inAscOrder = (arr) => arr.reduce((a,b)=> a < b ? b : undefined) ? true : false

// other solutions

function inAscOrder(arr) {
  return arr.slice(1).every((x, i) => x >= arr[i]);
}

// autres pproches 
let inAscOrder = arr => arr.every((v, i, a) => i ? v >= a[i - 1] : !0);

let inAscOrder = a => !a.some((el,i) => i > 0 && a[i] < a[i-1]);

const inAscOrder = nums => `${nums}` === `${nums.sort((a, b) => a > b)}`;

```

Predict your age

```javascript
const predictAge = (...ages) => Math.floor(Math.sqrt(ages.map(a => a*a).reduce((a,b)=>a+b))/2)

// Autre solutions
const predictAge = (...ages) => Math.hypot(...ages) / 2 | 0;

function predictAge(...a){
  return ~~(a.reduce((a,x)=>a+x*x,0)**0.5/2)
}

function predictAge(...n){
   return (Math.hypot(...n)/2)>>0 
}

const predictAge = (...a) => a.reduce((s,n)=> s+n*n,0)**0.5 *0.5|0

function predictAge(){
  return Math.floor(Math.sqrt(Array.from(arguments).reduce((sum,age)=>sum+age*age,0))/2);
}

const predictAge = (...ages) => Math.floor(Math.sqrt([...ages].map(item => item * item).reduce((prev, next) => prev + next)) / 2);

```

 Training JS #10: loop statement --for

```javascript
function pickIt (arr) {

  let odd = []
  let even =[]

    for (var x of arr) {
      ((x % 2) ? odd : even).push(x)
    }

  return [odd, even]

}

function pickIt(arr){
	var odd=[],even=[];
	for(i = 0; i < arr.length; i++){
		if(arr[i]%2 == 0) even.push(arr[i]);
		if(arr[i]%2 == 1) odd.push(arr[i]);
	}  

	return [odd,even];
}
```
Lazy Repeater

```javascript

// Solution propose
var makeLooper = (iterable) => {
	var i = 0;
	var length = iterable.length
	return () => {
		if(i<length){
			var res = iterable[i]
			i+=1
			return res
	  }else{
			i=0
			var res = iterable[i]
			i+=1
			return res
    }
  }
}

// oooh ?
function makeLooper(str) {
    var i = 0,l = str.length;
    return function(){
        return str[(i++)%l];
    }
}

// One liner
makeLooper = (s,i=0) => () => s[i++ % s.length]

const makeLooper = str => (i => x => str[i++ % str.length]) (0)

// Generator functions

function* gen(str) {
  for(let i = 0;;i++) {
    yield str[i % str.length];
  }
}

function makeLooper(str) {
  const it = gen(str);
  return () => it.next().value;
}

```

Transform to Prime

```
// Proposition d'approche de solution

const isPrime = (value) => {
  for(var i = 2; i < value; i++) {
    if(value % i === 0) {
      return false;
    }
  }
  return value > 1;
}

const add = (a,b) => a+b

const nextPrime = (n) => isPrime(n) ? n : nextPrime(n+1)

const minimumNumber = (arr) => {
  var res = arr.reduce(add)
    return nextPrime(res) - res
}

```

Sum of two integers

```javascript
// From a stackoverflow article
// https://stackoverflow.com/questions/41455750/how-to-add-two-numbers-in-javascript-without-using-or-operators

var add = function(a, b) {
    if (b == 0) {
        return a;
    } else {
        return add(a ^ b, (a & b) << 1)
    }
};

```


calculating with functions

```javascript
// approche de solution - possibilité de refactorer

const log = (something) => console.log(something)

const flatten = (args) =>
  args.reduce((a, v) => a.concat(v), [])

const dooperation = (args) =>
  args.length % 2 == 0 ? args : eval(flatten(args).reverse().join(''))


const plus = (...something) =>
  something.length === 0 ? '+' : dooperation(flatten(something.concat(['+'])))

const minus = (...something) =>
  something.length === 0 ? '-' : dooperation(flatten(something.concat(['-'])))

const times = (...something) =>
  something.length === 0 ? '*' : dooperation(flatten(something.concat(['*'])))

const dividedby = (...something) =>
  something.length === 0 ? '/' : dooperation(flatten(something.concat(['/'])))


const zero = (...something) =>
  something.length === 0 ? 0 : dooperation(flatten(something.concat(['0'])))

const one = (...something) =>
  something.length === 0 ? 1 : dooperation(flatten(something.concat(['1'])))

const two = (...something) =>
  something.length === 0 ? 2 : dooperation(flatten(something.concat(['2'])))

const three = (...something) =>
  something.length === 0 ? 3 : dooperation(flatten(something.concat(['3'])))

const four = (...something) =>
  something.length === 0 ? 4 : dooperation(flatten(something.concat(['4'])))

const five = (...something) =>
  something.length === 0 ? 5 : dooperation(flatten(something.concat(['5'])))

const six = (...something) =>
  something.length === 0 ? 6 : dooperation(flatten(something.concat(['6'])))

const seven = (...something) =>
  something.length === 0 ? 7 : dooperation(flatten(something.concat(['7'])))

const eight = (...something) =>
  something.length === 0 ? 8 : dooperation(flatten(something.concat(['8'])))

const nine = (...something)=>
  something.length === 0 ? 9 : dooperation(flatten(something.concat(['9'])))

// exemple d'operation
log(
  three(
    times(
      seven(
        times(
          seven(
            times(
              five()
            )
          )
        )
      )
    )
  )
)




```


sum of numerous arguments

```javascript

var findsum = (...args) => {
  if(args.length === 0) return 0
  if(args.filter(e => e >= 0 ).length === args.length){
    return args.filter(e => e >= 0 ).reduce((a,b) => a+b)
  }else{
    return -1
  }
}

// one liners
function findsum(...nums) {
  return nums.reduce((a, b) => a < 0 || b < 0 ? - 1 : a + b, 0)
}

function findsum(...x){
  return x.every(a=> a >= 0)? x.reduce((a,b)=>a+b,0) : -1;
}

// interressante sur la conversion de arguments
function findsum(){
  let args = [...arguments];
  return args.length > 0 ? args.reduce((a,b) => a >= 0 && b >= 0 ? a + b : -1) : 0;
}

const findsum = (...args) => args.every(arg => arg >= 0) ? args.reduce((total, int) => total + int, 0) : -1;

const findsum = (...args) => args.reduce((a,s)=> (a<0||s<0) ? -1: a+s, 0);

```
javascript router

```javascript

function router(){
  var routes = {}

  this.bind = function(url, method, fnrouter){
    var methods = {}
    methods[method] = fnrouter
    if(routes[url] === undefined){
      routes[url] = methods
      return undefined
    }else{
      object.assign(routes[url], methods)
      return undefined
    }
  }

  this.runrequest= function(url,method){
    try{
      return routes[url][method]()
    }catch(error){
      return 'error 404: not found'
    }
  }

}

// autres approches

class router {

    constructor() {
        this.routes = new map();
    }

    bind(url, method, action) {
        this.routes.set(url + ":" + method, action);
    }

    runrequest(url, method) {
        if (!this.routes.has(url + ":" + method)) {
            return "error 404: not found";
        }
        return this.routes.get(url + ":" + method)();
    }

}


// autres approches courte

var router = function(){
  this.responselookup = {};
}

object.assign(router.prototype, {
  bind: function(path, method, done) {
    this.responselookup[path+method] = done()
  },

  runrequest: function(path, method) {
    return this.responselookup[path+method] || 'error 404: not found';
  }
});

// autres

class router {
  constructor() {
    this.routes = new map()
  }
  bind(path, method, callback) {
    this.routes.set(method + path, callback)
  }
  runrequest(path, method) {
    return this.routes.has(method + path)
      ? this.routes.get(method + path)()
      : "error 404: not found"
  }
}

// autres interressante

var router = function() {
  this.routes = {};
}

router.prototype.bind = function(route, method, func) {
  if(typeof this.routes[method] === 'undefined') this.routes[method] = {};
  this.routes[method][route] = func;
}

router.prototype.runrequest = function(route, method) {
  if(this.routes[method] && this.routes[method][route]) {
    return this.routes[method][route]();
  } else {
    return 'error 404: not found';
  }
}


function isobject(x) {
    return x != null && typeof x === 'object';
}

function isfunction(functiontocheck) {
 var gettype = {};
 return functiontocheck && gettype.tostring.call(functiontocheck) === '[object function]';
}

var router = function(route, method, func)
{
}

router.prototype.methods = {};

router.prototype.bind = function(route, method, func) {
  if (!isobject(this.methods[route])) {
    this.methods[route] = {};
  }
  this.methods[route][method] = func;
}

router.prototype.runrequest = function(route, method) {
  var func = this.methods[route] && this.methods[route][method];
  if (isfunction(func)) {
    return func();
  } else {
    return 'error 404: not found';
  }
}


var router = function() {
  this.routes = [];
}
router.prototype.bind = function(r, method, f) {
  var found = false;
  for (var route of this.routes)
    if (route[0] == r && route[1] == method)
     {route[2] = f; found = true; break;}
  if (!found) this.routes.push([r, method, f]);
}
router.prototype.runrequest = function(r, method) {
  var picked = this.routes.filter(a => a[0] == r && a[1] == method);
  return picked.length ? picked[0][2]() : 'error 404: not found';
}

```


parse a linked list from a string



```javascript

const parse = (str) => {
  if(str === 'null'){ return null }
  var splitted = str.split('->').map(number)
  var noded = splitted.slice(0, splitted.length-1).map((data) => new node(number(data)))
  while(noded.length > 1){
    var nodelast = noded.pop()
    noded[noded.length-1].next = nodelast
  }
  return noded[0]
}

// autres approches

// reduceright
const parse = string => string.split(' -> ').slice(0, -1).reduceright((a, b) => new node(number(b), a), null);

// regexp
function parse(string) {
  const values = string.match(/\d+/g)
  return values && values.reduceright((next, value) => new node(+value, next), null)
}

function parse(string) {
  return string==="null" ? null : new node(parseint(string), parse(string.slice(string.indexof("->")+3)))
}

// stacki
function parse (string) {
  string = string.split(' -> ')
  string.pop()
  string.reverse()
  let node = null
  string.foreach(nextnode => { node = new node(parseint(nextnode), node) })
  return node
}

// json ??
function parse(string) {
  return string
    .split(' -> ')
    .reverse()
    .map(val => json.parse(val))
    .reduce((list, val) => new node(val, list));
}

// semblabe à la mienne
function parse(string) {
  let arr = string.split(' -> ')
  let node = new node(), head = node
  while (arr.length) {
    let curr = arr.shift()
    node.next = curr !== 'null' ? new node(+curr) : null
    node = node.next
  }
  return head.next
}

// classique for

function parse(s) {
  var res = s.split(" -> ");
  if ( res.length == 0 || res[0] == "null") return null;

  var list = new node(parseint(res[0]));
  var head = list;
  for ( var i = 1; i < res.length-1; ++i){
    if ( res[i] !="null") {
      var num = parseint(res[i]);
      list.next = new node(num);
      list = list.next;
    }
  }
  return head;
}

```

replace with alphabet position

```javascript
function alphabetposition(text) {
  function range(start,stop) {
  var result={};
  var i = 1
  for (var idx=start.charCodeAt(0),end=stop.charCodeAt(0); idx <=end; ++idx){
    result[String.fromCharCode(idx)] = i
    i+=1
    //result.push(String.fromCharCode(idx));
  }
  return result;
};


var res = range('a','z');
  return text.split('').map(function(a){ return res[a.toLowerCase()] }).filter(function(n){ return typeof(n) != 'undefined' }).join(' ');
}

// Autres solutions
function alphabetPosition(text) {
  var result = "";
  for (var i = 0; i < text.length; i++){
    var code = text.toUpperCase().charCodeAt(i)
    if (code > 64 && code < 91) result += (code - 64) + " ";
  }

  return result.slice(0, result.length-1);
}

function alphabetPosition(text) {
  return text
    .toUpperCase()
    .match(/[a-z]/gi)
    .map( (c) => c.charCodeAt() - 64)
    .join(' ');
}

let alphabetPosition = (text) => text.toUpperCase().replace(/[^A-Z]/g, '').split('').map(ch => ch.charCodeAt(0) - 64).join(' ');

function alphabetPosition(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z]/g,'')
    .replace(/./g, c => c + " ")
    .replace(/[a-z]/g, c => c.charCodeAt(0) - 96)
    .trim();
}
```
Upside Down Number

```javascript
createArray = (debut,end) => {
  var arrayFinal = []
  for(var i = debut ; i < end ;  i++){
    arrayFinal.push(i)
  }
  return arrayFinal
}

not = (expr) => !expr

reverseArray = (array) => array.reverse()

join = (array, regex='') => array.join(regex)

splitAStringToArray = (something, regex='') => toS(something).split(regex)

toS = (something) => String(something)

toNum = (something) => Number(something)

reverseString = (someString) => reverseArray(join(splitAStringToArray(someString)))

chiffreNonReversable = (chiffre) => chiffre === 2 || chiffre === 3 || chiffre === 4 || chiffre === 5  || chiffre === 7

nombreContientChiffresNonReversables = (nombre) => splitAStringToArray(nombre).map(toNum).filter(chiffreNonReversable).length !== 0 ? true : false

nombreReversablesEnDessous10Reversable = (nombre) => nombre === 0 || nombre === 1 || nombre === 8 || nombre == 11

retournerNombreALenvers = (someNumber) => {
  if(someNumber === '6'){
    return '9'
  }
  if(someNumber === '9'){
    return '6'
  }
  return someNumber
}

isNumberUpsideDownEventually = (someNumber) => {
  if(someNumber < 12){
    return nombreReversablesEnDessous10Reversable(someNumber)
  }else{
    var splittedString =splitAStringToArray(someNumber)
    var reversedStringArray = splittedString.reverse()
    var someNumberUpsideDown = toNum(join(reversedStringArray.map(retournerNombreALenvers)))
    return not(nombreContientChiffresNonReversables(someNumber)) && (someNumberUpsideDown === someNumber)
  }
}

solve = (x,y) =>  createArray(x,y).filter(isNumberUpsideDownEventually).length

// autres approches
// etude à faire -
String.prototype.map = Array.prototype.map;
function solve(x,y) {
  const flip = s => s.map( v => "01____9_86"[v] ).reverse().join("") ;
  return Array.from( { length: y-x }, (_,i) => String(x+i) ).filter( x => x===flip(x) ).length;
}


function solve(x, y) {
  let count = 0;
  const rotate = (_) => _.split('').reverse().join('').replace(/6/g, 7).replace(/9/g, 6).replace(/7/g, 9);

  for (let i = x; i < y; i++) {
    if (/[23457]/.test(i)) continue;
    const num = '' + i;
    const center = num[Math.floor(num.length / 2)];
    if ((num.length % 2) && (center === '6' || center === '9')) continue;
    if (num === rotate(num)) count++;
  }

  return count;
};


const solve = (x, y) => [...Array(y - x).keys()]
  .filter(n => ((n + x) + '')
    .split('')
    .reverse()
    .map(n => [0,1,,,,,9,,8,6][n])
    .join('') == n + x)
  .length;

function solve(x, y) {
 var reversible = ['0', '1', '6', '8', '9'];
 var reversibleto = ['0', '1', '9', '8', '6'];
 var revasis = ['0', '1', '8'];
 var revcount = 0;
 for (var i = x; i < y; i++) {
   var arr = i.toString().split('');
   var len = arr.length;
   var isrev = reversible.includes(arr[0]);
   for (var j = 0; j < parseInt(len/2) && isrev; j++) {
     if (reversible.indexOf(arr[j]) != reversibleto.indexOf(arr[len-j-1]) ||
         reversible.indexOf(arr[j]) == -1 ||
         reversibleto.indexOf(arr[len-j-1]) == -1
         ) {
       isrev = false;
     }
   }
   if (len%2==1 && revasis.includes(arr[parseInt(len/2)]) == false) {isrev=false};
   if (isrev) {revcount++};
 }
 return revcount;
};



const reverseNums = {
    '0': '0',
    '1': '1',
    '6': '9',
    '8': '8',
    '9': '6'
};

// autre approche plus lisible
function solve(x, y) {
    let total = 0;
    for (let i = x; i < y; i++) {
        const regular = i.toString();

        let begin = 0, end = regular.length - 1;
        for (; begin <= end; begin++, end--) {
            if(regular[begin] !== reverseNums[regular[end]]){
                break;
            }
        }
        total += (begin > end ? 1: 0);
    }
    return total;
}


// element


function solve(x, y) {
  let res = 0;
  for (let i=x; i<y; i++){
    if (i.toString().search(/[23457]/g)===-1){
      let rev = i.toString().split('').reverse();
      rev = rev.map((item)=>{
        if (item === '6') return '9';
        if (item === '9') return '6';
        return item;
      })
      if (rev.join('') === i.toString()) {
        res++;
      }
    }
  }
  return res;
};


// lisible meilleur

const includedNums = ['0', '1', '6', '8', '9'];
const getSixorNine = num => num == '6' ? '9' : '6';

const filterNum = num => (
  num.toString().split('')
    .map(n => {
        const realNum = (n == '6' || n == '9')
          ? getSixorNine(n) : n;
        return includedNums.includes(realNum) ? realNum : null;
      }).reverse().join('')
)

const solve = (x, y) => {
  let acc = 0;
  for (let i = x; i < y; i++) {
    const upDownNum = filterNum(i)
    acc += upDownNum == i ? 1 : 0;
  }
  return acc;
}

```

Fun with list reduce

```javascript

const reduce = (head, f, init) => {
  var left = (head, f, init) => init
  var right = (head, f, init) => reduce(head.next, f, f(init, head.data))
  return head ? right(head, f, init) : left(head, f, init)
}

// One liner
function reduce(head, f, init) {
  return head ? reduce(head.next, f, f(init, head.data)) : init;
}

const reduce = (h, f, i) => h === null ? i : reduce(h.next, f, f(i, h.data));

function reduce(head, f, init) {
  var acc = init;
  while(head){
      acc = f(acc, head.data);
          head = head.next;
            
  }
    return acc;

}


function reduce(h,f,i) {
  for(;h;h=h.next)i=f(i,h.data);
  return i;
}


function reduce(head, f, init) {
  if (head === null) return 0;
  return head.next ? reduce(head.next, f, f(init, head.data)): f(init, head.data);
}

// Haskell like
const reduce = (head, f, init = null) => 
  ! head
  ? init
  : reduce(head.next, f,  f(init, head.data));
// Use of call
function reduce(head, f, init) {
  if (!head) return init
  init = f.call(null, init, head.data);
  return reduce(head.next, f, init)
}

```

Get Divisors

```javascript

function getDivisorsCnt(n) {
  for (var d = 0, i = n; i > 0; i--) {
    if (n % i == 0) d++;
  }

  
  return d;
}


// Sort of oneliner
function getDivisorsCnt(n){c=0; for (i=1;i<=(n>>1)+1;i++) if (n%i==0) c++; return n==1?1:c+1}

// plus simple
getDivisorsCnt = n => {
  let c = 0;
  for (let i = 0; i < n; i++) if (!(n % i)) c++;
  return c;
}
```

Covfefe

```javascript

covfefe = n => {
  var left = (n) => n + " covfefe"
  var right = (n) => n.replace(/coverage/g, "covfefe")
  return n.includes("coverage") ? right(n) : left(n)
}

// Autres approches

function covfefe(str) {
  const res = str.replace(/coverage/g, "covfefe")
  return res === str ? str + " covfefe" : res
}

function covfefe(str){
  if (str.match(/coverage/g) === null) return str + " covfefe";
  return str.replace(/coverage/g, "covfefe");
}

function covfefe(str){
  if(!str.includes("coverage")) str += " coverage";
  return str.replace(/(coverage)/g, "covfefe");
}
```

SillyCase

```javascript
// approche de solution
function sillycase(silly) {
  mil = Math.round(silly.length / 2 )
  final =''
  for(var i= 0; i < silly.length; i++){
    if(i>=mil){
      final += silly[i].toUpperCase()
    }else{
      final += silly[i].toLowerCase()

    }
  }
  return final
  }
```

Returning String

```javascript

const greet = (name) => `Hello, ${name} how are you doing today?`

const greet = x =>  "Hello, "+x+" how are you doing today?"

function greet(name){
  return ['Hello, ',name,' how are you doing today?'].join('');
}

// Funny
function greet(name){
  let str = "Hello, 1 how are you doing today?";
  let result = str.replace("1",name);
  return result;
}

```

Sum of all the multiples of 3 or 5
```javascript

// Approche
const findSum=n=>[...Array(++n).keys()].filter(e=>(e%3==0)||(e%5==0)).reduce((a,b)=>a+b)

// One linerish
const findSum = n => Array(n+1).fill().map((a,i)=>i).reduce((a,b)=>(b%3==0||b%5==0)?a+b:a+0);

const findSum(n) => [...Array(n)].map((_,i)=>i+1).filter(n=>n%3===0||n%5===0).reduce((s,n)=>s+n,0);


//Cryptique
const f = (k, n) => k * ~~(n/k) * ~~(n/k + 1) / 2;
const findSum = n => f(3, n) + f(5, n) - f(15, n);


function findSum(n) {
  let c_3 = ~~(n / 0x3);
  let c_5 = ~~(n / 0x5);
  let c_f = ~~(n / 0xf);
  
  let s_3 = c_3 * (0x3 + c_3 * 0x3) / 2;
  let s_5 = c_5 * (0x5 + c_5 * 0x5) / 2;
  let s_f = c_f * (0xf + c_f * 0xf) / 2;
  
  return s_3 + s_5 - s_f;
}
```
Argument mapper

```javascript
const createArgumentMap = (fn, ...args) => {
  var obj = { }
  var i = 1
    args.forEach(function(arg){
      obj['a'+i] = arg
      i+=1
    })
  return obj
}

function createArgumentMap(func) {
  let args = Array.from(arguments).slice(1),
      map = {};
    
  for (let i=0; i < func.length; i++){
    map[`a${i+1}`] = args[i];
  }  
  
  return map;
}

function createArgumentMap(fn,...x){
  let v = fn.toString().match(/\(.+(?=\))/);
  return v ? v[0].slice(1).split(',').reduce((a,e,i) => (a[e] = x[i], a),{}) : [];
}

function createArgumentMap(func,...values) {
  var obj = [];
  var params = func.toString().match(/^function\s*[^\(]*\(\s*([^\)]*)\)/)[1].split(/\,\s*/)
  if (values.length) params.forEach((x,y) => obj[x] = values[y])
  return obj
}

  function createArgumentMap(func) {
     var args = [...arguments].slice(1),
         params = func.toString()
                      .match(/\((.*)\)/)[1];
                      
     return   (params === "") ? []
            : params.replace(/, /g, ",")
                    .split(",")
                    .reduce((r, e, i) => {r[e] = args[i]; return r;}, {});
  }

function createArgumentMap(func, ...args) {
  let mapped = {}
  for (let i = 0; i < args.length; i++) {
    mapped['a' + (i + 1)] = args[i]
  }
  return mapped
}


function createArgumentMap(func) {
  var args = (/function\s[^(]*\(([^)]+)\)/g.exec(func.toString()) || ['']).pop().split(/,/g);
  return Array.prototype.slice.call(arguments, 1).reduce(function(p, c, i){ return p[args[i]] = c, p }, {});
}

// Wtf solution

function createArgumentMap(func) {
  var argumentNames = getArgumentNames(func);
  var argumentValues = arguments;
  var result = {};
  argumentNames.forEach(function(key, index) {
    result[key] = argumentValues[index+1];    
  });
  return result;
}

// shamelessly copied from http://stackoverflow.com/questions/1007981
var STRIP_COMMENTS = /((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg;
var ARGUMENT_NAMES = /([^\s,]+)/g;
function getArgumentNames(func) {
  var fnStr = func.toString().replace(STRIP_COMMENTS, '')
  var result = fnStr.slice(fnStr.indexOf('(')+1, fnStr.indexOf(')')).match(ARGUMENT_NAMES)
  if(result === null)
     result = []
  return result
}
```


Multiplication Table

```javascript
multiplicationTable = (size) => {
  var res = []
    for(var i =1; i <= size ; i++){
      var table = [...Array(size+1).keys()].map(e=>e*i)
      table.shift()
      res.push(table)
    }
  return res
}

// Autre approches

multiplicationTable = function(size) {

  return Array.apply(null, new Array(size)).map(function(val, i) {
    return Array.apply(null, new Array(size)).map(function(val, j) {
      return (i+1) * (j+1);
    });
  });
}


// One liner
multiplicationTable=(s)=>(b=s=>Array(s).fill(0),b(s).map((n,i)=>b(s).map((n,j)=>(i+1)*(j+1))))


multiplicationTable = function(size) {
   return Array(size).fill(0).map((_,j)=> 
          Array(size).fill(0).map((_,i)=>(j+1)*(i+1)));
}
```

Delete nth occurences

```javascript
// Approche de solution
const deleteNth = (arr, occ) => {
  var stockeur = {

  }

  var res = []

    arr.forEach((e) => {
      if(stockeur[e] >= occ){
        // Do nothing
      }else{
        if(stockeur[e] == undefined){
          stockeur[e] = 1
          res.push(e)
        }else{
          stockeur[e] += 1
          res.push(e)
        }
      }
    })
  return res
}

```

Simple multiplication

```javascript

const simpleMultiplication = number => number % 2 == 0 ? number * 8 : number * 9

```


Concatenating functions 
Equivalent pipe

```javascript
// Solution proposé
Function.prototype.pipe = function(fn){
  var self = this
    return function(e){
      return fn(self(e))
    }
}

//usage 

var addOne = function(e) {
    return e + 1;
};

var square = function(e) {
    return e * e;
};

var result = [1,2,3,4,5].map(addOne.pipe(square)) //-> [4,9,16,25,36]

// Autres approches

Function.prototype.pipe = function(fun) {
  return function(param) {
    return fun(this(param));
  }.bind(this);
};

Function.prototype.pipe = function(fn) {
  return (...args) => fn(this(...args))
}

Function.prototype.pipe = function(f) {
  return function(a) { return f(this(a)); }.bind(this);
};

Function.prototype.pipe = function(){
  var fn = this, fns = arguments;
  
  return function(){
    var args = arguments;
    return Array.prototype.concat.apply(fn, fns).reduce(function(r, p){
      return p.apply(0, r ? [r] : args);
    }, 0);
  }
}

// Extend the Function prototype with a method pipe
Function.prototype.pipe = function(right) {
  var self = this;
  return function() {
    return right(self.apply(self, arguments));
  }
}

// Fonctionnelle avec reduce
Function.prototype.pipe = function(...fns) {
  return (x) => fns.reduce((acc, fn) => fn(this(acc)), x);
}
```

Fun with list length

```javascript
const length = (head, count=0) => {
  var left = (head, count) => count
  var right = (head, count) => length(head.next, (count+=1))
  return head ? right(head, count) : left(head, count)
}

// One liner

function length(head) {
  if (head == null) return 0;
  return 1 + length(head.next);
}

function length(head) {
  return head ? length(head.next) + 1 : 0
}

const length = head => !head ? 0 : 1 + length(head.next);

```


Fun with lists: filter 


```javascript
// Solution perso
function filter(head, p) {
  console.log(head,p.toString())
  left = undefined
  right = (head) => p(head.data) ? new Node((head.data), filter(head.next, p)) : filter(head.next, p)
  return !head ? left : right(head);
}

// One liner
function filter(head, p) {
  return !head ? null : p(head.data) ? new Node(head.data, filter(head.next, p)) : filter(head.next, p);
}

```

Fun with lists: map

```javascript

// Sol prop

parcoursLinkedList = (node, fn , futureArrayOfNodes  ) =>{
  if(node.next === null){
    futureArrayOfNodes.push(new Node(fn.call(null,node.data)))
    return futureArrayOfNodes
  }else{
    futureArrayOfNodes.push(new Node(fn.call(null,node.data)))
    return parcoursLinkedList(node.next, fn, futureArrayOfNodes)
  }
}

map = (head, f) =>  {
  if(head === null){ return null }
  var newArrayOfNodes = []

  parcoursLinkedList(head,f, newArrayOfNodes)

  return  newArrayOfNodes.reduceRight((a,b) =>{
    b.next = a
    return b
  })
}

// One-liner good

function map(head, f) {
  return !head ? null : new Node(f(head.data), map(head.next, f));
}


function map(head, f) {
  return head ? new Node( f(head.data), map(head.next, f) ) : null
}

function map(head, f) {
  if (!head)
    return null;
  let newList = new Node(f(head.data));
  let ptr = newList;
  head = head.next;
  while (head){
    ptr.next = new Node(f(head.data));
    ptr = ptr.next;
    head = head.next;
  }
  return newList;
}

function map(head, f) {
  let newHead = new Node(-1), dummy = newHead
  while(head) {
  newHead.next = new Node(f(head.data))
  newHead = newHead.next
  head = head.next

  }
  return dummy.next
}

function map(head, f) {
  if (!head) return null
  if (head.next!=null) return new Node(f(head.data),map(head.next,f))
  else return new Node(f(head.data))
}

```


find the unique number

```javascript

function findUniq(arr) {
  var uniqNumber = {}
  var min = arr[0]
  arr.forEach(function(num){
    if(typeof(uniqNumber[num]) === 'undefined'){
      uniqNumber[num] = 1
      min = num
    }
  })
  return min
}

// Approche ok

function findUniq(arr){
  var hashRetenu = {}

  arr.forEach(function(element){
    if(element in hashRetenu){
      hashRetenu[element] += 1
    }else{
      hashRetenu[element] = 1
    }
  })


  var min = 0
  for(e in hashRetenu){
    if(hashRetenu[e] === 1){
      min = Number(e)
    }
  }

  return min
}


// Autres approches
function findUniq(arr) {
  arr.sort((a,b)=>a-b);
  return arr[0]==arr[1]?arr.pop():arr[0]
}

function findUniq(arr) {
  let [a,b,c] = arr.slice(0,3);
  if( a != b && a!=c ) return a;
  for( let x of arr ) if( x!=a ) return x
}

function findUniq(arr) {
  return arr.find(n => arr.indexOf(n) === arr.lastIndexOf(n));
}


function findUniq(arr) {
  let uniq = {},
      result;
  arr.forEach(function(item) {
    uniq[item] = uniq[item] + 1 || 1;
  });
  Object.keys(uniq).forEach(function(key) {
    if (uniq[key] == 1) {
      result = key;
    }
  });
  return parseFloat(result);
}

const findUniq = arr => arr.filter(a => a !== arr[+(arr[1] === arr[2])])[0]

function findUniq(arr){
  arr = arr.sort()
  return arr[0] == arr[1] ? arr[arr.length - 1] : arr[0]
}

function findUniq(arr) {
	arr=arr.sort((a,b)=>a-b)
	return arr[0]==arr[1]? arr[arr.length-1]: arr[0]
}

```


Sort numbers

```javascript
var solution = (nums) => ( nums === null || nums === undefined) ?  [] : nums.sort((a,b) => a - b)

# Solutions autres
function solution(nums){
  return (nums || []).sort(function(a, b){
    return a - b
  });
}

function solution(nums){
    return nums !== null ? nums.sort(function(a,b){return a-b}) : [];
}

let solution = (nums) => (nums || []).sort((a,b) => (a-b))

```

Working with arrays I (and why your code fails in some katas)

```javascript

withoutLast = (essai) => {
  var res = []
  for(i=0; i<= essai.length-2; i++){
    res.push(essai[i])
  }
  return res
}


// autres approches

// usage du slice pour faire le pop
function withoutMax(arr) {
  // arr.pop();
  return arr.slice(0,-1);
}

function withoutMax(arr) {
  return arr.slice(0, arr.length - 1);
}
```

Square every digits

```javascript

const squareDigits = (num) => Number(String(num).split('').map((e) => String(Number(e) * Number(e))).join('')) ;


// autres solutions

function squareDigits(num){
  return Number(('' + num).split('').map(function (val) { return val * val;}).join(''));
}

function squareDigits(num){
  return +num.toString().split('').map(i => i*i).join('');
}

function squareDigits(num){
  return +(num+'').split('').map(a=>a*a).join('');
}

const squareDigits = (num) => Number((num + '').split("").map(c => c *c).join(""));

```


Multiply characters

```javascript

function spam(number){
  result = ''
  for(i=0; i < number ; i++){
    result += 'hue'
  }
  return result
}


// autres approches

function spam(number){
  return Array(++number).join("hue");
}

// Polyfill ?

function spam(number){
  return "hue".repeat(number);
}


// Polyfill the repeat function that is proposed for ECMAScript 6
if (!String.prototype.repeat) {
  String.prototype.repeat = function (count) {
    "use strict";
    if (this == null)
      throw new TypeError("can't convert " + this + " to object");
    var str = "" + this;
    count = +count;
    if (count != count)
      count = 0;
    if (count < 0)
      throw new RangeError("repeat count must be non-negative");
    if (count == Infinity)
      throw new RangeError("repeat count must be less than infinity");
    count = Math.floor(count);
    if (str.length == 0 || count == 0)
      return "";
    // Ensuring count is a 31-bit integer allows us to heavily optimize the
    // main part. But anyway, most current (august 2014) browsers can't handle
    // strings 1 << 28 chars or longer, so :
    if (str.length * count >= 1 << 28)
      throw new RangeError("repeat count must not overflow maximum string size");
    var rpt = "";
    for (;;) {
      if ((count & 1) == 1)
        rpt += str;
      count >>>= 1;
      if (count == 0)
        break;
      str += str;
    }
    return rpt;
  }
}

// Simple
function spam(number){
  return "hue".repeat(number);
}

function spam(number){
  if(number!=1) return "hue" + spam(+number-1)
  else return "hue";;
}

// mienne mais en moins de lignes

function spam(n) {
  var s = '';
  for(var i = 0; i < n; i++) s += 'hue';
  return s;
}
```


Initialize my name

```javascript

function initializeNames(name){
  toTransform = name.split(/\s/)
  arrLen = toTransform.length

  if(toTransform.length < 3){
    return toTransform.join(' ')
  }else{
    return [toTransform[0],
            toTransform.slice(1,arrLen-1 ).map((e) => e[0]+'.').join(' '),
            toTransform[arrLen -1]
            ].join(' ')
  }
}

// Autres approches
function initializeNames(name){
 var n = name.split(" ");
if(n.length < 3) return name;
for(i = 1; i < n.length-1; i++){
  n[i] = n[i][0] + ".";
}
return n.join(" ");
}

const initializeNames = name => name.replace(/ (\w)\w*(?= )/g, ' $1.')

function initializeNames(name){
  return name.split(' ').map((e,i,a) => i == 0 || i == a.length-1 ? e : e[0]+'.').join(' ');
}

function initializeNames(name) {
  return name.replace(/(?!^)\b(\w)\w+\b(?!$)/g, '$1.');
}

```

Moving zeros

```javascript

var moveZeros = function (arr) {
  return arr.filter(function(x) {return x !== 0}).concat(arr.filter(function(x)
  {return x === 0;}));

}



// other approach

var moveZeros = function (arr) {
  return arr
    .filter((val) => val !== 0)
    .concat(arr.filter((val) => val === 0));
}

// Info

var moveZeros = (arr, count=[]) => {
	return arr.filter(e =>{
      if(e===0){ count.push(0) }
      return e !== 0
  }).concat(count)
}


```


Block building


```javascript

class Block {
  constructor(data){
    [this.w, this.l, this.h] = data;
  }
  getWidth(){ return this.w }
  getLength(){ return this.l }
  getHeight(){ return this.h }
  getVolume(){
    let {l, w, h} = this;
    return w*l*h;
  }
  getSurfaceArea(){
    let {l, w, h} = this;
    return 2 * (l*w + l*h + w*h);
  }
}

```


Evaluate a postfix expression


```javascript
// Semble good mais trop long
// Cas à revoir sur la division qui
// a besoin d'un arrondi
var postfixEvaluator = (string) => {
  console.log(string)
  stack = []
  a = string.split(' ')
  a.forEach(function(b){
    if(b === '+' || b === '-' || b === '*' ) {
      left = stack.pop()
      right = stack.pop()
      result = eval(right + b + left)
      stack.push(result)
    }else if( b === '/'){
      left = stack.pop()
      right = stack.pop()
      result = Math.floor(eval(right + b + left))
      stack.push(result)
    }else{
      stack.push(b)
    }
  })
  return (stack[0])
}

```
Weird Reverse

```javascript

weirdReverse=a=>a.sort(x=>1)

```

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

```javascript

var reverse = function(array){
  var reversedArray = []
  var i = array.length -1
  for(i; i >= 0 ; i--){ reversedArray.push(array[i]) }
  return reversedArray
}

```

Keep up the hoop

```javascript

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

BASICS: Length based SELECT with LIKE

```SQL
--- Approche
--- find first_name like 6 character long
SELECT first_name, last_name
FROM names
WHERE first_name LIKE '%_%_%_%_%_%_%';


select first_name, last_name from names where first_name like '______%'

select first_name, last_name from names where first_name ~ '.{6,}' -- like it :P


select a.first_name, a.last_name
from names a
where a.first_name like '%______%'


select first_name, last_name from names 
where not (first_name like '_____' or first_name like '____' or first_name like '___' or
first_name like '__' or first_name like '_')



select
   first_name
  ,last_name
from names
where first_name like repeat('_', 6) || '%';

```

SQL basic truncating

truncate two numbers towards zero

```SQL

SELECT TRUNC(number1+number2) AS towardzero FROM decimals;


SELECT TRUNC(d.number1+d.number2) as towardzero
from decimals d 


select case when (sum > 0) then low else high end
as towardzero from

           (select (number1 + number2) as sum, 
              floor(number1 + number2) as low,
               ceil(number1 + number2) as high
                from decimals) as foo;


SELECT CASE 
          WHEN number1+number2>0 
             THEN FLOOR(number1+number2)
          ELSE CEILING(number1+number2)
       END as towardzero
FROM decimals;


SELECT
  trunc((d.number1 + d.number2)::numeric, 0)::float AS towardzero
FROM decimals d


SELECT CASE 
  WHEN D.number1 + D.number2 > 0 THEN FLOOR(D.number1 + D.number2)
  ELSE CEIL(D.number1 + D.number2) END AS towardzero
FROM decimals D;


SELECT 
CASE 
  WHEN (number1 + number2) >= 0 THEN floor(number1 + number2)
  ELSE ceil(number1 + number2)
END AS towardzero
FROM decimals;



SELECT 
    CAST(TRUNC(CAST(number1+number2 AS numeric), 0) AS float) AS towardzero
FROM 
    decimals;


SELECT 
  (
    CASE WHEN d.number1+d.number2 > 0
      THEN FLOOR(d.number1+d.number2)
    ELSE
      CEIL(d.number1+d.number2)
    END
  ) AS towardzero
FROM decimals d;    


select cast(substring(cast((number1+number2) as varchar(10))
from '#"%#".%' for '#') as float)  as towardzero from decimals limit 100


SELECT CASE WHEN number1+number2>0 THEN CAST(FLOOR(number1+number2) as FLOAT) WHEN 
number1+number2<0 THEN CAST(CEILING(number1+number2) as FLOAT) END as towardzero
FROM decimals;

SELECT  TRUNC(number1 + number2)::float  AS towardzero FROM decimals 


select case 
When number1+number2 > 0 THEN floor(number1 + number2)
ELSE Ceiling(number1 + number2)
end
as towardzero
from decimals

SELECT to_char(TRUNC(number1 + number2), 'FM99999999.9')::FLOAT as towardzero FROM decimals


SELECT CASE 
WHEN (number1+number2) > 0 THEN FLOOR(number1+number2)
WHEN (number1+number2) < 0 THEN CEIL(number1+number2)
ELSE 0
END AS towardzero
FROM decimals;

SELECT CAST(TRUNC(CAST((number1 + number2) AS DECIMAL),0) AS FLOAT) AS towardzero FROM decimals;

```

Grocery store inventory



```SQL
SELECT id, name, stock
FROM products
WHERE stock <= 2 AND producent='CompanyA'
ORDER BY id;


SELECT p.id, p.name, p.stock
FROM products p
WHERE (p.stock<=2) AND (p.producent='CompanyA')
ORDER BY p.id DESC ;


SELECT id, name, stock 
FROM products
WHERE producent = 'CompanyA'
GROUP BY id, name, stock
HAVING stock <= 2
ORDER BY id

-- select all of the items
SELECT P.ID, P.NAME, P.STOCK
FROM PRODUCTS P
--INNER JOIN COMPANYA CA
--ON P.ID= CA.ID
WHERE STOCK < 3 AND PRODUCENT LIKE 'CompanyA'
ORDER BY ID

-- Approche stylistique sur indentation et usage du %
SELECT
      id,
      name,
      stock
FROM
      products
WHERE
      stock <= 2
      and producent like '%CompanyA%'
ORDER BY
      id;
```

Easy Sql rounding decimals

Round down first then round up

```SQL

SELECT FLOOR(number1) AS number1, CEIL(number2) AS number2 FROM decimals;

SELECT FLOOR(number1) AS number1, CEILING(number2) AS number2 FROM decimals;

SELECT
  FLOOR(number1::numeric)::float as number1,
  CEILING(number2::numeric)::float as number2
FROM decimals;

SELECT
  floor(d.number1) number1,
  ceil(d.number2) number2
FROM decimals d

select round(number1-.49) as number1, round(number2+.49) as number2 from decimals

/*  SQL  */
/* Select (number1 % 1) as down, round(number2) as up from decimals  */
Select floor(number1) as number1, ceil(number2) as number2 from decimals

/* SELECT number1, number2, floor(number1) as number12,
       CASE WHEN number2 <=0
       THEN ceil(number2)
       ELSE ceil(number2)
       END AS number22
FROM decimals */


UPDATE decimals
SET number1=FLOOR(number1),
number2=CEILING(number2);
SELECT number1, number2 FROM decimals;


select  
ROUND(CASE
    WHEN number1 < 0 AND (trunc(number1)-number1>0) THEN trunc(number1)-1
    ELSE trunc(number1)
  END) 
  AS number1,
ROUND(CASE
    WHEN number2 > 0 AND (number2-trunc(number2)>0) THEN trunc(number2)+1
    ELSE trunc(number2)
  END) 
  AS number2
from decimals 

```

Hello Sql World

```SQL
CREATE TABLE Greeting (Greeting);
INSERT INTO Greeting VALUES ('hello world!'); 
SELECT * FROM   Greeting ;


SELECT 'hello world!' as "Greeting"


CREATE TABLE words
(
Greeting varchar(255)
);
INSERT INTO words (Greeting) VALUES ('hello world!');
SELECT * FROM words;


SELECT 'hello' || ' world!' AS Greeting


select 'hello world!' as Greeting from sqlite_sequence 


CREATE TABLE hellosqlworld (Greeting TEXT);
INSERT INTO hellosqlworld (Greeting) VALUES ('hello world!');
select * from hellosqlworld;



CREATE TABLE table1 (Greeting TEXT);
INSERT INTO table1 (Greeting)
VALUES ('hello world!');
SELECT * FROM table1;


drop table if exists Greet;
create table Greet (
  Greeting text
);
insert into Greet values ('hello world!');
select * from Greet;
```

Register for the Party

```SQL

INSERT INTO participants VALUES ('BENOIT', 28, true) ;
SELECT * FROM participants WHERE age > 21 AND attending=true;


INSERT into participants (name, age, attending) values ('Greg', 21, true);
SELECT * FROM participants;

INSERT INTO participants ("name", "age", "attending") values ('yourself', 21, true); --Your code here
SELECT * FROM participants;

INSERT INTO participants (name, age, attending)
VALUES ('Krysia', 24, true);
SELECT * FROM participants;

```

```SQL

SELECT * 
FROM books
ORDER BY copies_sold DESC
LIMIT 5;

# Element a reflechir
SELECT TOP 5 *
FROM books
ORDER BY copies_sold DESC ;

```

Adults only

```sql

SELECT * FROM users WHERE age >= 18 ;

SELECT * FROM users WHERE age > 17


SELECT *
from users
where age>=18
order by age  asc


SELECT * FROM users
WHERE NOT age < 18;

SELECT t.name
      ,t.age
FROM users t
WHERE t.age >= 18;

```

SQL concatening columns

```sql

   SELECT CONCAT(prefix,' ', first,' ',last,' ',suffix) AS title FROM names;

   SELECT concat_ws(' ', prefix,first,last,suffix) AS title FROM names;

   SELECT "prefix" || ' ' || "first" || ' ' || "last" || ' ' || "suffix" as title from names


  SELECT CONCAT(prefix, ' ',first, ' ', last, ' ',suffix) "title" from names;

  SELECT CONCAT(TRIM(prefix), ' ', TRIM(first), ' ', TRIM(last), ' ', TRIM(suffix)) AS title 
FROM names

   SELECT concat(names.prefix, ' ', names.first, ' ', names.last, ' ', names.suffix) AS title
FROM names
```

Créer une fonction Sql

```
CREATE FUNCTION increment(@input INTEGER)
  RETURNS INTEGER
  AS BEGIN
    DECLARE @Work INTEGER

    SET @Work = @Input + 1

    RETURN @work
END

```

SQL Basic mod

```sql
# Approche
SELECT MOD(number1, number2) from decimals;

# autres

SELECT
  NUMBER1 % NUMBER2 AS MOD
FROM
    DECIMALS

SELECT MOD(number1,number2) FROM decimals AS resulttable

```
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


ORDER BY INFO

```SQL

SELECT * from companies ORDER BY employees DESC;

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

```ruby

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

```

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

Roman numeral decoder


```ruby

def solution(roman_number)
  roman_number_hash = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'C' => 100,
    'M' => 1000,
    'L' => 50,
    'D' => 500
  }
  previous = ''
  res = 0
  roman_number.split('').reverse.each do |letter|
    if previous == 'X' && letter == 'I'
      res -= 1
      previous =''
    elsif previous == 'V' && letter == 'I'
      res -= 1
      previous =''
    else
      res += roman_number_hash[letter]
      previous = letter
    end
  end
  return res
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

```javascript

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

Palindrome integer composition


```ruby
# First approach

class Fixnum
  def palindrome?
    to_s == to_s.reverse
  end
end

def calcul(nb, squares)
  carres_ok = squares.select{|e| e < nb}
  res = false
  while carres_ok.size > 0
    carres_ok.reverse.reduce do |a,b|
      calc = a+b
      if calc == nb
        res = true
        break
      else
        calc
      end
    end

    break if res == true
    carres_ok.pop
  end
  return res
end

def values(nombre_max)
  racines = (1..nombre_max).map{|e| e*e}.select{|a| a < nombre_max }
  (0..nombre_max).select(&:palindrome?).select{|n| calcul(n, racines)}.size
end

# Second approach to improve


def values(nbr)
  racines = (Array(1..nbr)).map{|x| x**2}.reverse.select{|n| n <= nbr}
  resultat = []
  while racines.size > 0  do
    racines.reduce do |prev, succ|
      calcul = prev + succ
      if (calcul < nbr) && (calcul).to_s == (calcul).to_s.reverse
        resultat << calcul
        calcul
      elsif calcul > nbr
        break
      else
        calcul
      end
    end
  racines.shift
  end
  resultat.uniq.count
end

```

Javascript creation de generateurs
Reflexion en cours

```javascript
//'use strict';
//
// CodeWars kata https://www.codewars.com/kata/es5-generators-i
//
// to think

const log = (something) => console.log(something)

const mul = (a,b) => a * b
const add = (a,b) => a+b

const generator = (...sequencer) => {
  if( sequencer.length > 1 ){
    return {next: sequencer[0].apply(null,sequencer.slice(1)) }
  }else{
    return {next: sequencer[0].apply(null,this) }
  }

}

dummySeq = function(){
  return function(){
    return  "dummy"
  }
}


const createArray = (number) => {
  var res = []
  for(var i = 1;  i< number; i++){
    res.push(i)
  }
  return res
}

const factorialSeq = () => {
   var i = 1
  return () => {
    if(i == 0 || i == 1){
      i+=1
      return 1
    }else{
      var res = i
      i+=1
      return createArray(res).reduce(mul)
    }
  }
}


const fibonnaciSeq = () => {
  var i = 1
  return () => {

    var fibonacci = (n) => {
      return n < 1 ? 0
        : n <= 2 ? 1
        : fibonacci(n - 1) + fibonacci(n - 2);
    }
    var aCalculer = i
    i+=1
    return fibonacci(aCalculer)
  }

}


const rangeSeq = (start, step) => {
  this.info = i
  var i = start
  var inc = step
  return () =>{
    var res = i
    i+= inc
    return res
  }
}

var partialSumSeq = (...args) => {
  var info = args
  var i = 1
  var prev = null
  return () => {
    if(i === 1){
      i+=1
      return args[0]
    }
    if(i<= args.length){
      var res = i
      i+=1
      return args.slice(0,res).reduce(add,0)
    }else{
      return 'End of sequence error expected'
    }
  }
}

const isprime = (n) => {
  var q = Math.floor(Math.sqrt(n))
  for(var i = 2; i <= q ; i++){
    if(n%i === 0){
      return false
    }
  }
  return true
}

const nextprime = (n) => {
  return n > 1 && isprime(n) ? n : nextprime(n+1)
}
const primeSeq = () => {
  var i = 0
  return () => {
    var res = nextprime(i)
    i = res
    i+=1
    return res
  }
}


var assert = require('assert');
describe('Array', function() {
  describe('#indexOf()', function() {
    it('should return -1 when the value is not present', function() {
      assert.equal([1,2,3].indexOf(4), -1);
    });
  });
});


describe('Generators in js without yield function', function() {
  describe('List of generators', function() {

    it('should  dummy generator', function() {
      var seq = generator(dummySeq)
      assert.equal(seq.next(),'dummy');
      assert.equal(seq.next(),'dummy');
      assert.equal(seq.next(),'dummy');
      assert.equal(seq.next(),'dummy');
      assert.equal(seq.next(),'dummy');
    });

    it('should factorial generator', function() {
      var seq = generator(factorialSeq)
      assert.equal(seq.next(),1);
      assert.equal(seq.next(),1);
      assert.equal(seq.next(),2);
      assert.equal(seq.next(),6);
      assert.equal(seq.next(),24);
    });

    it('should fibonnaci generator', function() {
      var seq = generator(fibonnaciSeq)
      assert.equal(seq.next(),1);
      assert.equal(seq.next(),1);
      assert.equal(seq.next(),2);
      assert.equal(seq.next(),3);
      assert.equal(seq.next(),5);
      assert.equal(seq.next(),8);
      assert.equal(seq.next(),13);
    });

    it('should range generator', function() {
      var seq = generator(rangeSeq, 5, 3)
      assert.equal(seq.next(),5);
      assert.equal(seq.next(),8);
      assert.equal(seq.next(),11);
      assert.equal(seq.next(),14);
    });

    it('should partial sum generator', function() {
      var seq = generator(partialSumSeq, -1, 4, 2, 5)
      assert.equal(seq.next(),-1);
      assert.equal(seq.next(),3);
      assert.equal(seq.next(),5);
      assert.equal(seq.next(),10);
      assert.equal(seq.next(),'End of sequence error expected');
      assert.equal(seq.next(),'End of sequence error expected');
      assert.equal(seq.next(),'End of sequence error expected');
    });

    it('should prime generator', function() {
      var seq = generator(primeSeq)
    assert.equal(seq.next(), 2);
    assert.equal(seq.next(), 3);
    assert.equal(seq.next(), 5);
    assert.equal(seq.next(), 7);
    assert.equal(seq.next(), 11);
    assert.equal(seq.next(), 13);
    assert.equal(seq.next(), 17);
    assert.equal(seq.next(), 19);
    });

  });

  describe('createArray', function() {
    it('should create an array of consecutive sucessor', function() {
      var res = createArray(5)
      assert.equal(res[0], 1)
      assert.equal(res[1], 2)
      assert.equal(res[3], 4)
    });

  });
});



//var fn = function(start, end) {
//
//      var slicedArgs = Array.prototype.slice.call(arguments);
//      console.log(slicedArgs);
//
//};



var  seqNormale = () => {
  var n = 0
  return () => {
    n+=1
    return n
  }

}


var seqNormale = generator(seqNormale)

var seqPrimes = generator(primeSeq)

var seqFibonnaci = generator(fibonnaciSeq)

var seqFactorial = generator(factorialSeq)

var seqRangeStep = generator(rangeSeq, 1, 3)

var partialSumSeq = generator(partialSumSeq, -1, 4, 2, 5)

var primeSeqGen = generator(primeSeq)

log("DUMMY")

log("sequence normale")
log(seqNormale.next())
log(seqNormale.next())
log(seqNormale.next())
log(seqNormale.next())

log("CreateArray")
log(createArray(5))
log(createArray(4))
log(createArray(6))

log("Factorial")
log(seqFactorial.next())
log(seqFactorial.next())
log(seqFactorial.next())
log(seqFactorial.next())

log("Fibonnaci")
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())
log(seqFibonnaci.next())

log("RangeStep")
log(seqRangeStep.next())
log(seqRangeStep.next())
log(seqRangeStep.next())
log(seqRangeStep.next())

log("Partial sum seq")
log(partialSumSeq.next())
log(partialSumSeq.next())
log(partialSumSeq.next())
log(partialSumSeq.next())
log(partialSumSeq.next())
log(partialSumSeq.next())
log(partialSumSeq.next())

log("PrimeSeq")
log(primeSeqGen.next())
log(primeSeqGen.next())
log(primeSeqGen.next())
log(primeSeqGen.next())
log(primeSeqGen.next())
log(primeSeqGen.next())
log(primeSeqGen.next())
```

Nombres upsides down - Reflexion en cours

```javascript

// createArray :: Number -> Number -> [Number]
createArray = (debut,end) => {
  var arrayFinal = []
  for(var i = debut ; i < end ;  i++){
    arrayFinal.push(i)
  }
  return arrayFinal
}

// emptyString :: String
basicSplit =''
// not :: Any -> Boolean
not = (expr) => !expr

// reverseArray :: [Any] -> [Any]
reverseArray = (array) => array.reverse()

// joinArrayToString :: [String] -> String
joinArrayToString = (array, regex) => array.join(regex)

// splitString :: String -> Regex -> [String]
splitString = (someString, regex) => someString.split(regex)

// toS :: Any -> String
toS = (something) => String(something)

// toNum :: Any -> Number
toNum = (something) => Number(something)

// reverseString :: String -> String
reverseString = (someString) => reverseArray(splitString(someString,basicSplit)).join('')

// isPalindrome :: Number -> Boolean
isPalindrome = (someNumber) => reverseString(toS(someNumber)) === toS(someNumber)

// nombreNonReversable :: Number -> Boolean
nombreNonReversable = (num) => num === 5 || num === 2 || num === 3 || num === 4 || num === 7

// contientNombresNonReversable :: Number -> Boolean
contientNombresNonReversable = (nombre) => splitString(toS(nombre), basicSplit).map(toNum).filter(nombreNonReversable).length === 0 ? false : true

//nombreReversablesEnDessous10Reversable :: Number -> Boolean
nombreReversablesEnDessous10Reversable = (nombre) => nombre === 0 || nombre === 1 || nombre === 8 || nombre == 11


// retournerNombreALenvers :: Number -> String
retournerNombreALenvers = (someNumber) => {
  var res = undefined
  if(someNumber === '6'){
    return '9'
  }
  if(someNumber === '9'){
    return '6'
  }
  return someNumber
}

// isNumberUpsideDownEventually :: Number -> Boolean
isNumberUpsideDownEventually = (someNumber) => {
  if(someNumber < 12){
    return nombreReversablesEnDessous10Reversable(someNumber)
  }else{
    return not(contientNombresNonReversable(someNumber)) && (toNum(splitString(toS(someNumber),'').reverse().map(retournerNombreALenvers).join('')) === someNumber)
  }
}

// Indique la taille des nombres upside down
// solve :: Number -> Number -> [Number]
solve = (x,y) => {
log(x)
log(y)
  return createArray(x,y).filter(isNumberUpsideDownEventually).length
}

//log(solve(0,100))

```
Range function
Use of an iterator

```javascript

// approche
function* range(...args){
  switch(args.length){
    case 1:
      var begin = 1;
      var end = args[0]
        for(var i=begin; i <= end ; i++){
          yield i
        }
      break

    case 2:
      var begin = args[0];
      var end = args[1]
        for(var i=begin; i <= end ; i++){
          yield i
        }
      break

    case 3:
      var begin = args[0];
      var end = args[2]
      var increment = args[1]
        for(var i=begin; i <= end ; i+= increment){
          yield i
        }
      break
  }
}

// Recursion
function range(min, step, max) {
  if (arguments.length === 1) return range(1, 1, min)
  if (arguments.length === 2) return range(min, 1, step)
  const result = []
  for (let i = min; i <= max; i += step) {
    result.push(i)
  }
  return result
}

// Fonction plus generique

function* range(n) {
  switch (arguments.length) {
    case 1: yield* _range(1, n, 1); break;
    case 2: yield* _range(n, arguments[1], 1); break;
    case 3: yield* _range(n, arguments[2], arguments[1]); break;
  }
}

function* _range(a, b, d) {
  for (let x = a; x <= b; x += d) yield x;
}

function range(...a) {
  let [start, step, stop] = [1, 1, a[0]];
  if (a.length === 2) [start, stop] = a;
  if (a.length === 3) [start, step, stop] = a;
  return Array(Math.ceil((stop - start + 1) / step)).fill(0).map((n, i) => start + i * step);
}

// One linerish

let range = (start, step, stop) => stop ? Array.from(new Array(Math.ceil((1+stop-start)/step)),(val,index) => index*step + start) : step ? Array.from(new Array(1+step-start),(val,index)=>index+start) : Array.from(new Array(start),(val,index)=>index+1);


range = (...〸) => {
  let [ start, step, end ] = (〸.length == 1 ? [1, 1, 〸[0] ] : 〸.length == 2 ? [〸[0], 1, 〸[1]] : [〸[0], 〸[1], 〸[2]])
  return [...Array(((end-start)/step^0)+1)].map(($,_)=>start+_*step)
}
```

Format words into a sentence
Reflexion en cours

```javascript
var sentencize = arr => {
  if(arr.length == 2) return arr[0] + " and " + arr[1]
  begin = arr.slice(0, arr.length-2).join(", ") + ", "
  ending = arr.slice(Math.max(arr.length - 2, 1)).join(" and ")
  //ending = arr.slice(1).join(" and ")
  return begin + ending
}
function formatWords(words){
  if(words === null || words === undefined) return ""
  if(words.length === 0) return ""
  if(words.length === 1) return words[0]
  var transf = words.filter((e)=> e !=='')
  return transf.length === 1 ? transf[0] : sentencize(transf)
  }
```

Training JS #26: methods of arrayObject---map()

```javascript
function isolateIt(arr){
  function isEven(n){ return n%2 === 0 }
  function divideEqually(n){ return n.slice(0,n.length/2)+'|'+ n.slice(n.length/2) }
  function substitutionMethod(n){ return n.slice(0, Math.round(n.length/2)-1) +'|'  + n.slice(Math.round(n.length/2)) }
  return arr.map(function(e){
    return isEven(e.length) ? divideEqually(e) : substitutionMethod(e)
  })
}

```

Group by commas

```javascript

function groupByCommas(n) {
	var count=0
  var stringToWork = String(n)
  if(stringToWork.length<=3) return stringToWork
	return stringToWork.split('').reduceRight((a,b)=>{
		if(count === 2){
			res = b+','+a
			count = 0
		}else{
			res = b+a
			count+=1
		}
		return res
	})

}

```

Training JS #27: methods of arrayObject---filter()

```javascript

const countGrade = (arr) => {
var marks = {
  S:0,
  A:0,
  B:0,
  C:0,
  D:0,
  X:0
}
  marks['S'] = arr.filter(s=>s===100).length
  marks['A'] = arr.filter(s=>s<100 && s >=90).length
  marks['B'] = arr.filter(s=>s<90 && s >=80).length
  marks['C'] = arr.filter(s=>s<80 && s >=60).length
  marks['D'] = arr.filter(s=>s<60 && s >=0).length
  marks['X'] = arr.filter(s=>s ==-1 ).length
  return marks
}

// Autres approches

function countGrade(scores){
  return {
    'S': scores.filter(function(x){return x == 100}).length,
    'A': scores.filter(function(x){return (x < 100 && x >= 90)}).length,
    'B': scores.filter(function(x){return (x < 90 && x >= 80)}).length,
    'C': scores.filter(function(x){return (x < 80 && x >= 60)}).length,
    'D': scores.filter(function(x){return (x < 60 && x >= 0)}).length,
    'X': scores.filter(function(x){return x == -1}).length,
  };
}


function grade(marks) {
  if (marks == 100) return "S";
  if (marks >= 90) return "A";
  if (marks >= 80) return "B";
  if (marks >= 60) return "C";
  if (marks >= 0) return "D";
  return "X";
}

function countGrade(scores){
  let result = {S: 0, A: 0, B: 0, C: 0, D: 0, X: 0};
  scores.forEach(score => result[grade(score)] += 1);
  return result;
}

grade = marks => {
  if (marks == 100) return "S";
  if (marks >= 90) return "A";
  if (marks >= 80) return "B";
  if (marks >= 60) return "C";
  if (marks >= 0) return "D";
  return "X";
}

function countGrade(scores){
  var res = { S:0, A:0, B:0, C:0, D:0, X:0 };
  Object.keys(res).map( (key, index) => res[key] = scores.map( score => grade(score)).filter( v => v == key).length );
  return res;
}

// Plus separée
function countGrade(scores) {
  return {S: countRange(100, 100, scores), A: countRange(90, 99, scores), 
          B: countRange(80, 89, scores), C: countRange(60, 79, scores),
          D: countRange(0, 59, scores), X: countRange(-1, -1, scores)};
}

function countRange(start, end, array) {
  return array.filter(x=>x<=end&&x>=start).length;
}
```

Parse linked list to String

```javascript

  const stringify = (head) => {
    if(head == null) return "null"
    var res = []
      const traverse = (head) => {
          var left  = (a) =>{ res.push(String(a.data)) ; res.push("null") ; return null }
          var right = (a) => { res.push(String(a.data)) ; return traverse(a.next) }
        return head.next ? right(head) : left(head)
      }
    traverse(head)
    return res.join(' -> ')
  }

// One liner
function stringify(list) {
  return list === null ? "null" : `${list.data} -> ${stringify(list.next)}`; 
}

function stringify(list) {
  return [...(function*(){ while(list !== null) { yield list.data; list = list.next } yield "null"; })()].join(" -> ");
}

function stringify(list) {
  if(!list) return JSON.stringify(list); 
  let current = list;
  let arrow = " -> ";
  let str = "";
  while (current) {
    str += current.data + arrow;
    current = current.next;
  }
  str += current;
  return str;
}

function stringify(list) {
var string = '';
while(list) {
  string += list.data + ' -> ';
  list = list.next
}

string += 'null';
return string;
}

function stringify(list) {
  if (!list) return 'null'
  if(arguments[0].next == null) return arguments[0].data + ' -> null'
  return arguments[0].data + ' -> ' + stringify(arguments[0].next)
}
```

Kata Simple Events -> Reflection en cours

```javascript

// kata link http://www.codewars.com/kata/simple-events/train/javascript
var log = function(something){
  console.log(something)
  return something
}
var Event = function(){
  this.handlers = []
  this.subscribe = function(fn){
    this.handlers.push(fn)
  }

  this.unsubscribe = function(fn){
    // Remove a precise function from handlers so no poping way
    var index = this.handlers.indexOf(fn);
    if (index > -1) {
      this.handlers.splice(index, 1);
    }
  }

  this.emit = function(...args){
    this.handlers.forEach(function(fn){
      return fn.apply(null, args)
    })
  }
}
    var event = new Event();

    function f() {
        f.calls = (f.calls || 0) + 1;
        f.args = Array.prototype.slice.call(arguments);
    }

log(

    event.subscribe(f)
)
log(

    event.emit(1, 'foo', true)
)
    //
    // Test.expect(f.calls === 1); // calls a handler
    // Test.assertSimilar(f.args, [1, 'foo', true]); // passes arguments

    event.unsubscribe(f);
    event.emit(2);

log(

    f.calls === 1
)
    //Test.expect(f.calls === 1); //no second call


```
 A Reflechir Range Kata

```javascript


// Reflextion à lire
// https://stackoverflow.com/questions/30650961/functional-way-to-iterate-over-range-es6-7

function* createRange(...args){

  switch(args.length){
    case 1:
    var begin = 1
    var end = args[0]+1
    var res = []
    for (var i = begin; i < end; i++ ) res.push(yield i) ;
    return res
    break
  }
}
var res = [].push(...createRange(4))
console.log(res )

  console.log(
      Array.from(Array(4), (_, i) => i+1 )
      )
```

Wave js

Reflexion en cours

```javascript
// About remove duplicate in a array
// https://stackoverflow.com/questions/1960473/get-all-unique-values-in-an-array-remove-duplicates#14438954
function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
}

//[word, word[e].toUpperCase(), e]
const wave = word => {
  return [...Array(word.length).keys()].map((e)=>{
    var res =Array.from(word)
    res[e] = word[e].toUpperCase()
    return res.join('')
  }).filter(onlyUnique)
}

```


Reverse words

```ruby
# manque tous les mots y compris le dernier avec point
def reverse_words(str)
  regex = /\w+/i
  str.gsub(regex){ $&.reverse }
end

```

Selecting Quotients From an Array

Reflexion en cours

```ruby
def sel_quot(arr, m, dir_str=nil)
res1 = arr.permutation(2).map(&:reverse)
                         .map{|e| [e.reduce(&:/), e]}
                         .select{|e| e[1].reduce(&:%).zero? && e[1][0] != e[1][1] }
                         .sort_by{|e| e[0]}.uniq
some_res = res1.select{|e| m <= e[0]  }
if dir_str.to_s.downcase == ""
  some_res
elsif dir_str.to_s.downcase == "odd"
  res_final = some_res.select{|e| e[0].odd?}.sort
  return res_final
else
  res_final = some_res.select{|e| e[0].even?}.sort
  return res_final
end
end
```

Accumulate - reflexion en cours penser a refactorer

```ruby

module Enumerable
  #alias :accumulate :reduce
  def fusion_avec_start start, a_stack, block  #
    stack = a_stack.to_a
    res = start
    until stack.empty?
      actuel = stack.shift
      res = block.call(res, actuel)
    end
    return res
  end

  def fusion_sans_start start, a_stack, block  #
    stack = a_stack.to_a 
    res = stack.shift 
    until stack.empty?
      actuel = stack.shift
      res = block.call(res, actuel)
    end
    return res
  end

  def fusion_avec_symbol(start, a_stack, block)
    stack = a_stack.to_a 
    op = start
    res = stack.shift
    until stack.empty?
      actuel = stack.shift
      #user de send
      # 1.method(:+).call(1) #=> renvoie 2
      res = res.method(op).call(actuel)
    end
    return res
  end

  def accumulate start=nil, &block

    if block_given?  && start
      return fusion_avec_start start, self, block 
    end

    if block_given?  && start.nil?
      return fusion_sans_start start, self, block
    end

    if !block_given? && start.is_a?(Symbol)
      return fusion_avec_symbol(start, self, block)
    end
  end
end

```
Sum of odd Numbers - trompe d'approche mais interressant

```ruby

def  find_odd_pyramid n
  return [1] if n == 1
  return [1, 3, 5] if n == 2
  return (1..Float::INFINITY).lazy.select{|e| e.odd? && e > find_odd_pyramid(n-1).last}.first(n)
end

def row_sum_odd_numbers(n)
  find_odd_pyramid(n).lazy.reduce(&:+)
end

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
Last n elements from array in js from 

```javascript
// https://stackoverflow.com/questions/6473858/in-a-javascript-array-how-do-i-get-the-last-5-elements-excluding-the-first-ele 

arr.slice(Math.max(arr.length - 5, 1))

```
