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

Odd-Even string sort

```python

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
