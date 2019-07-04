require 'set'

class GridError < StandardError
  def initialize(msg = 'num_rows and num_cols must be integers greater than 0')
    super
  end
end

class ObstaclesError < StandardError
  def initialize(msg = 'obstacles should be an array of valid cell indexes')
    super
  end
end

class RobotGrid
  def initialize(num_rows, num_cols, obstacles = nil)
    raise GridError unless valid_rows_and_columns?(num_rows, num_cols)
    @num_rows = num_rows
    @num_cols = num_cols
    raise ObstaclesError unless obstacles.nil? || valid_obstacles?(obstacles)
    create_maze(num_rows, num_cols, obstacles)
  end

  def path
    # puts "New Search!"
    @path = []
    @seen = Set.new
    return @path if backtrack?(@num_rows - 1, @num_cols - 1)
    []
  end

  def backtrack?(row, col)
    # puts "Checking cell #{[row, col]}"
    return false if row < 0 || col < 0 || \
                    @maze[row][col].nil? || @seen.include?([row, col])

    if (row.zero? && col.zero?) || \
       backtrack?(row, col - 1) || \
       backtrack?(row - 1, col)
      @path.push([row, col])
      return true
    end

    @seen.add([row, col])
    false
  end

  private

  def valid_rows_and_columns?(num_rows, num_cols)
    num_rows.class == Integer && num_cols.class == Integer && \
      num_rows > 0 && num_cols > 0
  end

  def valid_obstacles?(obstacles)
    obstacles.class == Array && \
      (obstacles.empty? || \
      obstacles.all? { |o| valid_row_index?(o[0]) && valid_col_index?(o[1]) })
  end

  def valid_row_index?(index)
    index.class == Integer && index >= 0 && index < @num_rows
  end

  def valid_col_index?(index)
    index.class == Integer && index >= 0 && index < @num_cols
  end

  def create_maze(num_rows, num_cols, obstacles)
    @maze = Array.new(num_rows) { Array.new(num_cols, 1) }
    return if obstacles.nil?
    obstacles.each.each { |r, c| @maze[r][c] = nil }
  end
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

p RobotGrid.new(2, 2, [[1, 0]]).path # [[0, 0], [0, 1], [1, 1]]
p RobotGrid.new(2, 3, [[1, 1]]).path # [[0, 0], [0, 1], [0, 2], [1, 2]]
p RobotGrid.new(2, 3, [[0, 1], [1, 1]]).path # []
p RobotGrid.new(3, 3, [[0, 2], [2, 1]]).path
# [[0, 0], [1, 0], [1, 1], [1, 2], [2, 2]]
