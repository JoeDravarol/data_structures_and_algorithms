class Tree
  attr_accessor :root

  def initalize
   @root = nil
  end

  Node = Struct.new(:value, :parent, :left_child, :right_child)

  def build_tree(data, cur_node = nil)
    return @root if data.empty?

    @root = Node.new(data.shift) if @root.nil?
    cur_node = @root if cur_node.nil?

    # Left child node
    if data[0] < cur_node.value
      if cur_node.left_child.nil?
        cur_node.left_child = Node.new(data.shift, cur_node)
      else
        # Current become the left child of current node
        build_tree(data, cur_node.left_child)
      end
    # Right child node
    else
      if cur_node.right_child.nil?
        cur_node.right_child = Node.new(data.shift, cur_node)
      else
        # Current become the right child of current node
        build_tree(data, cur_node.right_child)
      end
    end

    build_tree(data)
  end

  def breadth_first_search(target, queue = [@root])
    return nil if queue.empty?
    cur_node = queue.shift

    if target == cur_node.value
      return cur_node
    else
      queue << cur_node.left_child unless cur_node.left_child.nil?
      queue << cur_node.right_child unless cur_node.right_child.nil?
    end

    breadth_first_search(target, queue)
  end

  # Using preorder dfs
  def depth_first_search(target)
    stack = [@root]

    until stack.empty?
      cur_node = stack.pop
      stack << cur_node.left_child unless cur_node.left_child.nil?
      stack << cur_node.right_child unless cur_node.right_child.nil?

      return cur_node if target == cur_node.value
    end

    nil
  end

  # Recursive depth first search
  def dfs_rec(target, cur_node = @root)
    return nil if cur_node.nil?

    if target == cur_node.value
      return cur_node
    else
      target_node = dfs_rec(target, cur_node.left_child)
      # If target is found, no need to go into the right child node
      target_node = dfs_rec(target, cur_node.right_child) unless target_node
    end
    target_node
  end
end

tree = Tree.new
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
