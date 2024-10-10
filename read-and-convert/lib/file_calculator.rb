require_relative 'binary_converter.rb'

class FileCalculator
  def convert(file_path)
    file = File.open(file_path)
    file_content = File.read(file).split.select { |elemento| elemento.match?(/\A[01]+\z/) }
    file.close
    total = 0
    file_content.each do |content| 
      number = BinaryConverter.new.to_integer(content)
      total += number
    end
    return total
  end
end
