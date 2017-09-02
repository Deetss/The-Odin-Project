#Linked List implementation

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end
    #Subclass Node for our linked list
    class Node
        attr_accessor :value, :next_node
        
        #initialize each Node with value and next_node set to nil
        def initialize(value = nil, next_node = nil)
            @value = value
            @next_node = next_node
        end
    end
    
    #Adds new node to the end of the list
    def append(value)
        if head == nil
            prepend(value)
        else
            tmp = head
            while tmp.next_node != nil
                tmp = tmp.next_node
            end
            tmp.next_node = Node.new(value)
        end
    end

    #Adds new Node to begining of list
    def prepend(value)
        @head = Node.new(value, head)
    end
    
end

list = LinkedList.new
list.append("a")
list.append("b")
list.prepend(1)
list.append(100)
p list