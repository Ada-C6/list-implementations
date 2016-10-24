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
       current = @head    ### The current is the node it's on now, and the next_node is the next one! (almost always need current)
       while current.next_node != nil   ### This while loop pattern is EXTREMELY common
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
    answer = false
    while answer == false && current.next_node != nil
      answer = true if current.value == key
      current = current.next_node
    end
    answer = true if current.value == key
    return answer
   end

   def size  ## use display as the model
    current = @head
    total_length = 0
    while current.next_node != nil
      total_length += 1
      current = current.next_node
    end
    total_length += 1
    return total_length
   end

   def max
    current = @head
    return nil if @head.value == nil
    max = @head.value

    while current.next_node != nil
      max = (current.next_node).value if (current.next_node).value > current.value
      current = current.next_node
    end
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

puts "Max: #{ll.max}"
puts "Size: #{ll.size}"
puts "Include 10: #{ll.include?(10)}"
puts "Include 20: #{ll.include?(20)}"
puts "Include 3: #{ll.include?(3)}"

ll.add(3)
puts "Include 3: #{ll.include?(3)}"


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
