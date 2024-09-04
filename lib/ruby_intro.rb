# frozen_string_literal: true

# Part 1

def sum(arr)
  sum = 0
  for i in arr do
    sum+=i
  end
  return sum
end

def max_2_sum(arr)
  if arr.size()==0
    return 0
  elsif arr.size()==1
    return arr[0]
  end
  max_2, max_1=[arr[0], arr[1]].minmax
  for i in 2..arr.size()-1 do
    if arr[i]>max_1 and arr[i]>max_2
      max_2 = max_1
      max_1 = arr[i]
    elsif arr[i]<=max_1 and arr[i]>max_2
      max_2 = arr[i]
    end
  end
  return max_1+max_2
end

def sum_to_n?(arr, number)
  map = Hash.new
  for i in arr do
    if not map[number-i]
      map[i] = 1
    else
      return true
    end
  end
  return false
end

# Part 2

def hello(name)
  "Hello, "+name
end

def starts_with_consonant?(string)
  if string.length !=0 and not (['a', 'e', 'i', 'o', 'u'].include?(string[0].downcase)) and (string[0].downcase.ord > 96 and string[0].downcase.ord < 123)
    return true
  end
  false
end

def binary_multiple_of_4?(string)
  for i in 0..string.length-1
    if string[i].ord != 48 and string[i].ord != 49
      return false
    end
  end
  if string.length == 0
    return false
  elsif string.length == 1 and string[-1]=='0'
    return true
  elsif string.length >=2 and (string[-1]=='0' and string[-2]=='0')
    return true
  end
  return false
end

# Part 3

# Object representing a book
class BookInStock
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    if isbn==''
      raise ArgumentError, "ISBN should not be empty!"
    end
    @isbn = isbn
    if price<=0
      raise ArgumentError, "Price should be positive"
    end
    @price = price
  end
  def isbn=(string)
    if string==''
      raise ArgumentError, "ISBN should not be empty!"
    end
    @isbn = string
  end
  def price=(value)
    if value<=0
      raise ArgumentError, "Price should be positive"
    end
    @price = value
  end
  def price_as_string
    "$" + ("%.2f" % price).to_s
  end
end
