#Binary Tree search implementation
class BinaryTree
    class Node
        attr_accessor :value, :parent, :left, :right

        #Give each node coresponding parent, and children
        def initialize(value = nil , parent = nil, left = nil, right = nil)
            @value = value
            @parent = parent
            @left = left
            @right = right
        end

        def insert(new_value)
            if new_value <= @value
                if @left.nil?
                    @left = Node.new(new_value)
                    @left.parent = self
                else
                    @left.insert(new_value)
                end
            elsif new_value > @value
                if @right.nil?
                    @right = Node.new(new_value)
                    @right.parent = self
                else
                    @right.insert(new_value)
                end
            end            
        end
    end

    attr_accessor :root
    #gives each tree a root
    def initialize(root = nil)
        @root = root
    end

    def insert(value)
        if @root.nil?
            @root = Node.new(value)
        else
            @root.insert(value)
        end
    end

    def build_tree(array)
        mid = array.slice(0,array.length/2).max
        array.delete(mid)
        @root = Node.new(mid)
        array.each do |item|
            insert(item)
        end
    end

    def breadth_first_search(key)
        queue = [@root]
        queue.each do |node|
            queue << node.left unless node.left.nil?
            queue << node.right unless node.right.nil?
            
            if node == key
                node
            end
        end

    end

end

tree = BinaryTree.new
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
root = tree.root
#p root
p tree.breadth_first_search(23)

# >> #<BinaryTree::Node:0x000000009164f0 @value=8, @parent=nil, @left=#<BinaryTree::Node:0x00000000916f18 @value=1, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x00000000917760 @value=3, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x00000000917f58 @value=4, @parent=nil, @left=#<BinaryTree::Node:0x000000008cff50 @value=4, @parent=nil, @left=nil, @right=nil>, @right=#<BinaryTree::Node:0x000000008cfd48 @value=5, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x000000008cfc58 @value=7, @parent=nil, @left=#<BinaryTree::Node:0x000000008cfaf0 @value=7, @parent=nil, @left=nil, @right=nil>, @right=#<BinaryTree::Node:0x000000008cf988 @value=8, @parent=nil, @left=nil, @right=nil>>>>>>, @right=#<BinaryTree::Node:0x000000008cf780 @value=9, @parent=nil, @left=#<BinaryTree::Node:0x000000008cf5c8 @value=9, @parent=nil, @left=nil, @right=nil>, @right=#<BinaryTree::Node:0x000000008a3f90 @value=23, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x000000008a3f68 @value=67, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x000000008a3f40 @value=324, @parent=nil, @left=nil, @right=#<BinaryTree::Node:0x000000008a3f18 @value=6345, @parent=nil, @left=nil, @right=nil>>>>>>