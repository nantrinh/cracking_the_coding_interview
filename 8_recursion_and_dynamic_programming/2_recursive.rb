class GridError < StandardError
  def initialize(msg = 'num_rows and num_cols must be integers greater than 0')
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

  def path
    backtrack(@num_rows - 1, @num_cols - 1)
    @path
  end

  def backtrack(row, col)
    return if row < 0 || col < 0

    if (row.zero? && col.zero?) || \
       backtrack(row, col - 1) || \
       backtrack(row - 1, col)
      @path.push([row, col])
    end
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

p RobotGrid.new(1, 1).path # [[0, 0]]
p RobotGrid.new(1, 2).path # [[0, 0], [0, 1]]
p RobotGrid.new(2, 2).path # [[0, 0], [1, 0], [1, 1]]
p RobotGrid.new(2, 3).path # [[0, 0], [1, 0], [1, 1], [1, 2]]
p RobotGrid.new(3, 3).path # [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2]]
p RobotGrid.new(3, 4).path
# [[0, 0], [1, 0], [2, 0], [2, 1], [2, 2], [2, 3]]
p RobotGrid.new(4, 4).path
# [[0, 0], [1, 0], [2, 0], [3, 0], [3, 1], [3, 2], [3, 3]]
