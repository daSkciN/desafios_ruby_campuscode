class HomeworkSolver
  def initialize(exercise_path)
    @exercise_path = exercise_path
    @file = File.open(exercise_path)
  end

  def solve(answer_sheet_path)  
    file_content = File.readlines(@file)
    result = []
    @file.each do |linha|     
      operation = linha.chomp
      result << eval(operation)      
    end
    File.open(answer_sheet_path, "a") do |file|
      file<< <<-OUTPUT.strip
      #{result.join("\n")}
      OUTPUT
    end
  end
end


