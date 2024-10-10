require 'spec_helper'

describe CanCrush do
  it '1. Pedra esmaga uma lata no muro.' do
    wall_of_cans = [[1,2]]
    rocks = [[2,1]]
    result = [[1,0]]
    can_crush = CanCrush.new(wall_of_cans)

    expect(can_crush.throw(rocks)).to eq result
  end

  it '2. Pedra esmaga uma lata no muro.' do
    wall_of_cans = [[1,2],
                    [4,2]]
    rocks = [[2,1]]
    result = [[1,0],
              [4,2]]
    can_crush = CanCrush.new(wall_of_cans)

    expect(can_crush.throw(rocks)).to eq result
  end

  it '3. Pedra esmaga uma lata e amassa outra abaixo.' do
    wall_of_cans = [[1,2,5],
                    [3,5,2],
                    [4,2,1]]
    rocks = [[3,1]]
    result = [[1,0,5],
              [3,4,2],
              [4,2,1]]
    can_crush = CanCrush.new(wall_of_cans)

    expect(can_crush.throw(rocks)).to eq result
  end

  it '4. Duas pedras esmagam e amassam latas no muro.' do
    wall_of_cans = [[1,2,5],
                    [3,5,2],
                    [4,2,1]]
    rocks = [[3,1],
             [2,2]]
    result = [[1,0,3],
              [3,4,2],
              [4,2,1]]
    can_crush = CanCrush.new(wall_of_cans)

    expect(can_crush.throw(rocks)).to eq result
  end


  it '5. Várias pedras esmagam e amassam latas no muro.' do
    wall_of_cans = [[7,2,6,4,2,4],
                    [2,6,6,8,3,5],
                    [4,1,7,3,4,5],
                    [1,2,6,4,5,2],
                    [1,5,2,7,8,9]]
    rocks = [[5,2],
             [7,0],
             [7,3],
             [2,1],
             [9,4],
             [3,0]]
    result = [[0,0,1,0,0,4],
              [0,6,6,5,0,5],
              [3,1,7,3,0,5],
              [1,2,6,4,5,2],
              [1,5,2,7,8,9]]
    can_crush = CanCrush.new(wall_of_cans)

    expect(can_crush.throw(rocks)).to eq result
  end
end
