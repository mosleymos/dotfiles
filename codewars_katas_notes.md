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


### javascript

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







## En reflexion
