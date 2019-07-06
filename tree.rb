class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
   
  end

end
class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

#queue.enqueue(1)
#queue.enqueue(2)
#queue.enqueue(3)
#queue.enqueue(4)
#queue.enqueue(5)
#puts queue.dequeue
#queue.enqueue(6)
#puts queue.dequeue
#puts queue.dequeue
#puts queue.dequeue
#puts queue.dequeue

# The "Leafs" of a tree, elements that have no children


def bfs(node, search)
  queue = []
  queue.push(node)
 
  until queue.empty?
    p queue.map { |n| n.payload }
    n = queue.shift
    if n.payload == search
      return n
    end
    queue = queue + n.children
  end
end
def dfs(node, search)
  queue = []
  queue.push(node)
 
  until queue.empty?
    p queue.map { |n| n.payload }
    n = queue.shift
    if n.payload == search
      return n
    end
    queue.concat n.children
  end
end
 

deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])
queue = MyQueue.new
queue.enqueue (queue)
puts bfs(trunk, 11)
puts dfs(trunk, 11)
puts queue.dequeue