require 'spec_helper'

describe DrawingBoard do
  it '1. Desenha uma instrução.' do
    instructions = {
      "1":{
        "top_left": [0, 0],
        "dimensions": [3, 2],
        "emblem": "%"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    %%
    %%
    %%
    BOARD

    expect(drawing).to eq result
  end

  it '2. Desenha duas instruções.' do
    instructions = {
      "1":{
        "top_left": [0, 0],
        "dimensions": [3, 2],
        "emblem": "%"
      },
      "2": {
        "top_left": [1, 5],
        "dimensions": [4, 2],
        "emblem": "@"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    %%.....
    %%...@@
    %%...@@
    .....@@
    .....@@
    BOARD

    expect(drawing).to eq result
  end

  it '3. Desenha instruções com sobreposição de emblemas.' do
    instructions = {
      "1":{
        "top_left": [0, 0],
        "dimensions": [3, 6],
        "emblem": "%"
      },
      "2": {
        "top_left": [1, 5],
        "dimensions": [4, 2],
        "emblem": "@"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    %%%%%%.
    %%%%%&@
    %%%%%&@
    .....@@
    .....@@
    BOARD

    expect(drawing).to eq result
  end

  it '4. Desenha instruções com repetição e sobreposição de emblemas.' do
    instructions = {
      "1":{
        "top_left": [0, 0],
        "dimensions": [3, 6],
        "emblem": "%"
      },
      "2": {
        "top_left": [1, 5],
        "dimensions": [4, 2],
        "emblem": "@"
      },
      "3":{
        "top_left": [4, 3],
        "dimensions": [1, 6],
        "emblem": "%"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    %%%%%%...
    %%%%%&@..
    %%%%%&@..
    .....@@..
    ...%%&&%%
    BOARD

    expect(drawing).to eq result
  end

  it '5. Desenha instruções com repetição e sobreposição de emblemas.' do
    instructions = {
      "1":{
        "top_left": [0, 0],
        "dimensions": [7, 7],
        "emblem": "%"
      },
      "2": {
        "top_left": [2, 2],
        "dimensions": [4, 4],
        "emblem": "@"
      },
      "3":{
        "top_left": [3, 3],
        "dimensions": [2, 2],
        "emblem": "%"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    %%%%%%%
    %%%%%%%
    %%&&&&%
    %%&**&%
    %%&**&%
    %%&&&&%
    %%%%%%%
    BOARD

    expect(drawing).to eq result
  end

  it '6. Desenha instruções com repetição e sobreposição de emblemas.' do
    instructions = {
      "1":{
        "top_left": [3, 2],
        "dimensions": [3, 6],
        "emblem": "*"
      },
      "2": {
        "top_left": [0, 0],
        "dimensions": [4, 2],
        "emblem": "@"
      },
      "3":{
        "top_left": [4, 6],
        "dimensions": [2, 5],
        "emblem": "&"
      },
      "4":{
        "top_left": [5, 5],
        "dimensions": [5, 3],
        "emblem": "%"
      },
      "5":{
        "top_left": [6, 5],
        "dimensions": [2, 1],
        "emblem": "@"
      },
      "6":{
        "top_left": [1, 0],
        "dimensions": [2, 1],
        "emblem": "&"
      },
      "7":{
        "top_left": [2, 5],
        "dimensions": [2, 3],
        "emblem": "@"
      },
      "8":{
        "top_left": [0, 0],
        "dimensions": [10, 11],
        "emblem": "%"
      }
    }
    drawing = DrawingBoard.new(instructions).draw
    result = <<~BOARD.chomp
    &&%%%%%%%%%
    &&%%%%%%%%%
    &&%%%&&&%%%
    &&&&&%%%%%%
    %%&&&&&&***
    %%&&&******
    %%%%%*%%%%%
    %%%%%*%%%%%
    %%%%%%%%%%%
    %%%%%%%%%%%
    BOARD

    expect(drawing).to eq result
  end
end
