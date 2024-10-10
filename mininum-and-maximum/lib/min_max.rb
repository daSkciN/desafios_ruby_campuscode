class MinMax
  def find(values)
    string = values.split()
    numbers = string.select { |str| str =~ /^-?\d+$/ }.map(&:to_i)
    letters = string.reject { |str| str =~ /^-?\d+$/ }
    strmin = letters.min_by{|str| str.length}
    strmax = letters.max_by{|str| str.length}
    intmin = numbers.min
    intmax = numbers.max 
    def tem_letras_repetidas?(str)
      letras = str.downcase.chars.select { |char| char =~ /[a-z]/ }
      letras.uniq.length != letras.length
    end
    strmin1 = letters.min_by{|str| str.length}
    strmin2 = letters.select { |str| tem_letras_repetidas?(str) }.min_by { |str| str.length }
    if strmin1 != nil && strmin2 != nil
      if strmin1.length < strmin2.length
        strmin = strmin1
      else
        strmin = strmin2
      end    
    end

    if strmin == nil 
      min = intmin
      max = intmax
    else
      if intmin == nil
        min = strmin
        max = strmax
      else
        if strmin.length < intmin 
          min = strmin
        else
          mini = strmin.downcase.chars.select { |char| char =~ /[a-z]/ }
          if strmin.length == intmin && (mini.uniq.length != mini.length) == true   
            min = strmin
          else
            min = intmin
          end
        end
        if strmax.length > intmax 
          max = strmax
        else
          maxi = strmax.downcase.chars.select { |char| char =~ /[a-z]/ }
          if strmax.length == intmax && (maxi.uniq.length != maxi.length) == true   
            max = strmax
          else
            max = intmax
          end
        end
      end
    end
     
  return "Mínimo: #{min}; Máximo: #{max}"
  end
end
