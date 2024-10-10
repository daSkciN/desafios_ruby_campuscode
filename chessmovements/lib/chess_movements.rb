class ChessMovements

  def self.valid_movement(piece_movements)
    @piece_movements = piece_movements
    result = []
    @piece_movements.each do |piece|
      pieces = piece.split(",").first.strip
      movement = piece.split(",").last.strip
      initial_position = movement.split(" -> ").first
      final_position = movement.split(" -> ").last
      x_initial = initial_position[0].ord - 'a'.ord
      x_final = final_position[0].ord - 'a'.ord
      y_initial = initial_position[1].to_i
      y_final = final_position[1].to_i

      if pieces == "Peão branco" 
        if y_final - y_initial == 1 && x_final == x_initial
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Peão preto"
        if y_initial - y_final == 1 && x_final == x_initial
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Torre branca"
        if y_final - y_initial <= 7 && x_final == x_initial
          result += ["Válido"]
        elsif y_final == y_initial && x_final - x_initial <= 7
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Torre preta"
        if y_initial - y_final <= 7 && x_final == x_initial
          result += ["Válido"]
        elsif y_final == y_initial && x_initial - x_final <= 7
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Rei branco" || pieces == "Rei preto"
        if y_final - y_initial == 1 || x_final - x_initial == 1 || y_initial - y_final == 1 || x_initial - x_final == 1
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Bispo branco" || pieces == "Bispo preto"
        if (y_final - y_initial) == (x_final - x_initial) && (y_final - y_initial) <= 7
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Rainha branca" || pieces == "Rainha preta"
        if x_initial == x_final || y_initial == y_final || (x_initial - x_final).abs == (y_initial - y_final).abs
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      elsif pieces == "Cavalo branco" || pieces == "Cavalo preto"
        if ((y_final - y_initial == 2 || y_initial - y_final == 2) && ((x_final - x_initial == 1) || (x_initial - x_final == 1))) || ((x_final - x_initial == 2 || x_initial - x_final == 2) && ((y_final - y_initial == 1) || (y_initial - y_final == 1)))
          result += ["Válido"]
        else
          result += ["Inválido"]
        end
      end
    end
  return result
  end

  def self.possible_captures(board)
    @board = board
    captures = []
    @board.each_with_index do |piece1,i|
      pieces1 = piece1.split(",").first.strip
      movement1 = piece1.split(",").last.strip
      color1 = pieces1.split(" ").last
      name1 = pieces1.split(" ").first
      if color1 == "branca"
        color1 = "branco"
      elsif color1 == "preta"
        color1 = "preto"
      end
      x1 = movement1[0].ord - 'a'.ord
      y1 = movement1[1].to_i
      @board.each_with_index do |piece2,j|
        if i != j 
          pieces2 = piece2.split(",").first.strip
          movement2 = piece2.split(",").last.strip
          color2 = pieces2.split(" ").last
          name2 = pieces2.split(" ").first
          if color2 == "branca"
            color2 = "branco"
          elsif color2 == "preta"
            color2 = "preto"
          end
          x2 = movement2[0].ord - 'a'.ord
          y2 = movement2[1].to_i
          if color1 != color2 
            if name1 == "Peão"
              if (y1 != y2 && (y2 - y1).abs == 1 && (x2 - x1).abs == 1)
                captures << "#{piece1} -> #{piece2}"
              end
            end
            if name1 == "Rainha"
              if x1 == x2 || y1 == y2 || (x1 - x2).abs == (y1 - y2).abs
                captures << "#{piece1} -> #{piece2}"
              end
            end
            if name1 == "Torre"
              if x1 == x2 || y1 == y2
                captures << "#{piece1} -> #{piece2}"
              end
            end
            if name1 == "Bispo"
              if (x1 - x2).abs == (y1 - y2).abs
                captures << "#{piece1} -> #{piece2}"
              end
            end
            if name1 == "Cavalo"
              if ((x1 - x2).abs == 2 && (y1 - y2).abs == 1) || ((x1 - x2).abs == 1 && (y1 - y2).abs == 2)
                captures << "#{piece1} -> #{piece2}"
              end
            end
            if name1 == "Rei"
              if (x1 - x2).abs <= 1 && (y1 - y2).abs <= 1 
                captures << "#{piece1} -> #{piece2}"
              end
            end
          end
        end
      end
    end
    return captures
  end
end
