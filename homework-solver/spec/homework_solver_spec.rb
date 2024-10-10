require 'spec_helper'

describe HomeworkSolver do
  it '1. Resolve a primeira lista de dever de casa' do
    File.open('data/answer_sheet1.txt', 'w') { |f| f.truncate(0) }
    solver = HomeworkSolver.new('data/exercise1.txt')
    solver.solve('data/answer_sheet1.txt')

    answers = <<~VARIABLE.chomp
    2
    7
    6
    36
    VARIABLE

    expect(File.open('data/answer_sheet1.txt').read).to eq(answers)
  end

  it '2. Resolve a segunda lista de dever de casa' do
    File.open('data/answer_sheet2.txt', 'w') { |f| f.truncate(0) }
    solver = HomeworkSolver.new('data/exercise2.txt')
    solver.solve('data/answer_sheet2.txt')

    answers = <<~VARIABLE.chomp
    1
    2
    20
    80
    VARIABLE

    expect(File.open('data/answer_sheet2.txt').read).to eq(answers)
  end

  it '3. Resolve a terceira lista de dever de casa' do
    File.open('data/answer_sheet3.txt', 'w') { |f| f.truncate(0) }
    solver = HomeworkSolver.new('data/exercise3.txt')
    solver.solve('data/answer_sheet3.txt')

    answers = <<~VARIABLE.chomp
    4
    4
    17
    60
    VARIABLE

    expect(File.open('data/answer_sheet3.txt').read).to eq(answers)
  end
end
