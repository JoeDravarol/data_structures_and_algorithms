class Square
  attr_accessor :x, :y, :parent, :children

  def initialize(x, y, parent = nil)
    @x = x
    @y = y
    @parent = parent
    @children = []
  end

  def create_children
    # 8 Possible knight's move
    moves = [[-1,+2], [-2,+1],[+1,+2], [+2,+1],[-2,-1], [-1,-2],[+1,-2], [+2,-1]]
    # Make children objects out of the legal knight's move
    moves.each do |move|
      @children << Square.new(@x+move[0],@y+move[1], self) if (@x+move[0]).between?(0,7) && (@y+move[1]).between?(0,7)
    end
    @children
  end
end

class Knight
  def knight_moves(start_coords, end_coords)
    start_square = Square.new(start_coords[0], start_coords[1])
    end_square = Square.new(end_coords[0], end_coords[1])

    get_path(start_square, end_square)
  end

  def breadth_first_search(starting, ending)
    queue = [starting]

    loop do
      current_move = queue.shift
      return current_move if current_move.x == ending.x && current_move.y == ending.y
      current_move.create_children.each { |child| queue << child }
    end
  end

  def get_path(starting, ending)
    result = breadth_first_search(starting, ending)

    path = []
    path.unshift([ending.x, ending.y])
    # Finding the result by going reverse order from ending node until it gets to starting node (Which has no parent)
    current_node = result.parent

    until current_node.nil?
      path.unshift([current_node.x, current_node.y])
      current_node = current_node.parent
    end
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |square| puts square.inspect }
  end
end

knight = Knight.new
knight.knight_moves([3,3], [5,0])