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


### javascript

Largest pair su_m in array

```javascript

largestPairSum = (numbers) => numbers.sort((a,b) => a < b ? 1 : -1).slice(0,2).reduce((a,b) => a+b )

```

## En reflexion
