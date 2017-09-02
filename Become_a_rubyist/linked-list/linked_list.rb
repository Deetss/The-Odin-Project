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
            self.prepend(value)
        else
            tmp = head
            while tmp != null
                tmp = tmp.next_node
            end

    end
    #Adds new Node to begining of listS
    def prepend(value)
        @head = Node.new(value, head)
    end
    
end

list = LinkedList.new
