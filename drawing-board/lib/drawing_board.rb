class DrawingBoard
  def initialize(instructions)
    @instructions = instructions
  end

  def draw
    max_width = 0
    max_height = 0
    @instructions.each do |_, instruction|
      top_left = instruction[:top_left] 
      dimensions = instruction[:dimensions]
      width = top_left[1] + dimensions[1]
      height = top_left[0] + dimensions[0]
      max_width = [max_width, width].max
      max_height = [max_height, height].max
    end
    board = Array.new(max_height) { Array.new(max_width, '.') }
    @instructions.each do |_, instruction|
      top_left = instruction[:top_left]  
      dimensions = instruction[:dimensions]
      emblem = instruction[:emblem]
      dimensions[0].times do |h|
        dimensions[1].times do |w|
          y = top_left[0] + h
          x = top_left[1] + w
          current_symbol = board[y][x]
          if current_symbol != '.'
            board[y][x] = combine_symbols(current_symbol, emblem)
          else
            board[y][x] = emblem
          end
        end
      end
    end
    board.map(&:join).join("\n")
  end

  def combine_symbols(symbol1, symbol2)
    combinations = {
      '@' => { '*' => '%', '%' => '&', '&' => '*' },
      '*' => { '%' => '&', '&' => '@', '@' => '%' },
      '%' => { '&' => '*', '@' => '&' },
      '&' => { '@' => '*', '%' => '*' }
    }
    if combinations[symbol1] && combinations[symbol1][symbol2]
      combinations[symbol1][symbol2]
    elsif combinations[symbol2] && combinations[symbol2][symbol1]
      combinations[symbol2][symbol1]
    else
      return symbol1 
    end
  end
end
