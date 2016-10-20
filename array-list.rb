# Implementation of a list using a Native array --> ruby does this automatically
# No using .anything! except for .length
class ArrayList
  def initialize
    @storage = [0,0,0,0,0,0,0,0,0,0]
    @size = 0
  end

  # Adds _value_ at the end of the list
  def add(value)
    @storage[@size] = value
    @size += 1
  end

  # Deletes the _last_ value in the array
  def delete
    @storage[@size-1] = 0 # Technically, this line is not required, since size is decreasing
    @size -= 1
  end

  def display
    bracket = "["
    @size.times do |i|
      bracket += @storage[i].to_s + ", "
    end
    return bracket + "]"
  end

  def include?(key)
    @size.times do |i|
      return true if @storage[i] == key
    end
      return false
  end

  # How many things are actually stored in the array, not how many could be
  def size
    return @size
  end

  def max #return largest element in array (similar to include?)
    return nil if @size == 0
    max = @storage[0] # Set to first value, rather than zero, just in case all are negative
    @size.times do |i|
      max = @storage[i] if @storage[i] > max
    end
    return max
  end

end

# Initializing an Array List
# arr = ArrayList.new
#
# # Adding Elements to Array List
# arr.add(10)
# arr.add(20)
#
# # Display the Array List
# puts "Displaying Array List:"
# arr.display
#
# puts "Delete last element and then display the array list:"
# arr.delete
# arr.display
