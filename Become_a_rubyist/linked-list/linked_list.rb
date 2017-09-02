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

    #Returns the size of the linked list
    def size
        size = 1
        tmp = head
        if head == nil
            size = 0
            size
        else
            while tmp.next_node != nil
                tmp = tmp.next_node
                size += 1
            end
        end
        size
    end

    
    #returns the last node in the list
    def tail
        if head == nil
            "Theres nothing in the list"
        else
            tmp = head
            while tmp.next_node != nil
                tmp = tmp.next_node
            end
        tmp
        end
    end
    #returns the node at a given index
    def at_index(index)
        if head == nil
            "Theres nothing in the list"
        else
            tmp = head
            i = 0
            while i != index
                tmp = tmp.next_node
                i += 1
            end
            tmp
        end
    end

    #removes the last node of the list
    def pop
        if head == nil
            "Nothing to remove"
        else
            prev = nil
            cur = head
            while cur.next_node != nil
                prev = cur
                cur = cur.next_node
            end
            prev.next_node = nil
        end
    end

    #Returns true if value is in the list
    def contains?(value)
        tmp = head
        if head == nil
            false
        else
            while tmp != nil && tmp.value != value
                tmp = tmp.next_node
            end

            if tmp == nil
                false
            else
                true
            end
        end
    end

    #Returns index of the current value
    def find(value)
        tmp = head
        i = 0
        if head == nil
            nil
        else
            while tmp != nil && tmp.value != value
                tmp = tmp.next_node
                i += 1
            end
            if tmp == nil
                "The value is not in the list"
            else
                i
            end
        end
    end

end

list = LinkedList.new
list.append("a")
list.append("b")
list.prepend(1)
list.append(100)
list.size
list.tail
p list.at_index(1)
p list
list.pop
p list
p list.contains?(143)
p list.find("b")
