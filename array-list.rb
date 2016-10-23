# Implementation of a list using a Native array --> ruby does this automatically

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
    @size -= 1
    # optional to actually zero out this element
    # @delete[@size] = 0
  end

  def display
    array_string = "["
    @size.times do |x|
      array_string += "#{@storage[x]}, "
    end
    return array_string + "]"
  end

  def include?(key)
    @size.times do |x|
      return true if @storage[x] == key
    end
    return false
  end

  def size
    return @size
  end

  def max
    return nil if @size == 0 
    @max = @storage[0]
    @size.times do |x|
      if @storage[x] > @max
        @max = @storage[x]
      end
    return @max
  end

end

# Initializing an Array List
arr = ArrayList.new

# Adding Elements to Array List
arr.add(10)
arr.add(20)

# Display the Array List
puts "Displaying Array List:"
arr.display

puts "Delete last element and then display the array list:"
arr.delete
arr.display
