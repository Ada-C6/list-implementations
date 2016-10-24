# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
  attr_accessor :value, :next_node

  def initialize(val,next_in_line=nil)
    @value = val
    @next_node = next_in_line
    puts "Initialized a Node with value:  " + value.to_s
  end
end

class LinkedList
  def initialize(val)
    # Initialize a new node at the head
    @head = Node.new(val)
  end

  def add(value)
    # Traverse to the end of the list
    # And insert a new node over there with the specified value
    # Also an extremely common pattern:
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.next_node = Node.new(value,nil)
    self
  end

  def delete(val)
    current = @head
    if current.value == val
      # If the head is the element to be delete, the head needs to be updated
      @head = @head.next_node
    else
      # ... x -> y -> z
      # Suppose y is the value to be deleted, you need to reshape the above list to :
      #   ... x->z
      # ( and z is basically y.next_node )
      current = @head
      while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
        current = current.next_node
      end

      if (current != nil) && (current.next_node != nil)
        current.next_node = (current.next_node).next_node
      end
    end
  end

  def display
    # Traverse through the list till you hit the "nil" at the end
    current = @head
    full_list = []
    while current.next_node != nil
      full_list += [current.value.to_s]
      current = current.next_node
    end
    full_list += [current.value.to_s]
    puts full_list.join("->")
  end

  def include?(key)
    current = @head

    while current.next_node != nil
      if current.value == key
        puts true
        return true
      end
      current = current.next_node
    end
      if current.value == key
        puts true
        return true
      end
    puts false
    return false
  end

  def size
    current = @head
    count = 0

    if max == nil
      puts "nil"
      return nil
    end

    while current.next_node != nil
      count += 1
      current = current.next_node
    end
    count += 1
    puts count
    return count
  end

  def max
    current = @head
    max = current.value

    if max == nil
      puts "nil"
      return nil
    end

    while current.next_node != nil
      if current.value >= max
        max = current.value
      end
      current = current.next_node
    end

    if current.value >= max
      max = current.value
    end
    puts max
    return max
  end
end

# Initializing a Linked List with a node containing value (5)
ll = LinkedList.new(5)

# Adding Elements to Linked List
ll.add(10)
ll.add(20)

# Display the Linked List
puts "Displaying Linked List:"
ll.display

puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display

ll.add(40)
ll.include?(10)
ll.include?(20)

ll.size
ll2 = LinkedList.new(1)
ll2.add(2)
ll2.add(3)
ll2.add(4)
ll2.add(5)
ll2.display
ll2.size

ll.max
ll2.max

ll3 = LinkedList.new(-1)
ll3.add(2)
ll3.add(4)
ll3.add(20)
ll3.add(1)
ll3.add(10)
ll3.add(-111)
ll3.display

ll3.include?(-111)
ll3.include?(-1)
ll3.include?(10)
ll3.include?(0)
ll3.size
ll3.max

ll3 = LinkedList.new(0)
ll3.display
ll3.include?(0)
ll3.include?(-111)
ll3.size
ll3.max

ll3 = LinkedList.new(nil)
ll3.display
ll3.include?(0)
ll3.include?(-111)
ll3.size
ll3.max
=begin
Output:
Initialized a Node with value:  5
Initialized a Node with value:  10
Initialized a Node with value:  20
Displaying Linked List:
5->10->20
Delete 10 and then display the linked list:
5->20
=end
