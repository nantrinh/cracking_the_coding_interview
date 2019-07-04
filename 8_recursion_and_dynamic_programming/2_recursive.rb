class GridError < StandardError 
  def initialize(msg='num_rows and num_cols must be integers greater than 0')
    super
  end
end

class RobotGrid
  def initialize(num_rows, num_cols)
    raise GridError unless valid?(num_rows, num_cols)
    @num_rows = num_rows
    @num_cols = num_cols
    @path = []
  end

  def get_path
    return @path if can_backtrack?(@num_rows - 1, @num_cols - 1) 
    'No path exists'
  end

  def can_backtrack?(row, col)
    return false if row < 0 || col < 0

    if (row.zero? && col.zero?) || \
        can_backtrack?(row, col - 1) || \
        can_backtrack?(row - 1, col) 
      @path.push([row, col])
      return true 
    end
    false
  end

  private

  def valid?(num_rows, num_cols)
    num_rows > 0 && num_cols > 0 && \
      (num_rows % 1).zero? && (num_cols % 1).zero?
  end
end

# testing invalid arguments
begin
  RobotGrid.new(-1, -1)
rescue GridError
  p true
end

begin
  RobotGrid.new(1, 1.5)
rescue GridError
  p true
end

p RobotGrid.new(1, 1).get_path # [[0, 0]]
p RobotGrid.new(1, 2).get_path # [[0, 0], [0, 1]]
p RobotGrid.new(2, 2).get_path # [[0, 0], [1, 0], [1, 1]]
p RobotGrid.new(2, 3).get_path # [[0, 0], [1, 0], [1, 1], [1, 2]]
p RobotGrid.new(3, 3).get_path # [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2]]
p RobotGrid.new(3, 4).get_path # [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2], [2, 3]]
