#!/usr/bin/env ruby

require "./fibonacci"

# Get new fibonacci enumerator
f = Fibonacci.fibonacci

# Get first five elements of the enumerator
t = f.take(5)
puts "First five elements of fibonacci enumerator"
puts "[#{t.join(', ')}]"
puts ""

# Get next five elements of the enumerator
t = f.take(10)
# drop removes the first `n` elements from the enumerator
d = t.drop(5)
puts "Next five elements of fibonacci enumerator"
puts "[#{d.join(', ')}]"
puts ""

# Get first five elements of the enumerator multiplied by five
t = f.take(5)
m = t.map { |elem| elem * 5 }
puts "First five elements of fibonacci enumerator multiplied by five"
puts "[#{m.join(', ')}]"
puts ""

# Get next five elements of the enumerator multiplied by five
t = f.take(10)
d = t.drop(5)
m = d.map { |elem| elem * 5 }
puts "Next five elements of fibonacci enumerator multiplied by five"
puts "[#{m.join(', ')}]"
puts ""

# Lazily get even values of fibonacci
# This means that the filtering will only be done when values are requested
l = f.lazy
s = l.select { |elem| elem.even? }

# Get first 5 even numbers
t = s.take(5)
puts "First five even elements of lazy fibonacci enumerator"
puts "[#{t.force.join(', ')}]"
puts ""

# Get next 5 even numbers
t = s.take(10)
d = t.drop(5)
puts "Next five even elements of lazy fibonacci enumerator"
puts "[#{d.force.join(', ')}]"
puts ""
