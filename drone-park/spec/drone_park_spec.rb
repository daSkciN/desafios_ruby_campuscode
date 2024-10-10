require 'spec_helper'

describe DronePark do
  it '1. Encontra um drone com a demarcação' do
    park_map = <<~PARK
    ___AA1234____
    _____________
    ___BB1234%___
    PARK
    drone_park = DronePark.new(park_map)

    expect(drone_park.search('%')).to eq ['BB1234']
  end

  it '2. Quando não encontra drones ou demarcação' do
    park_map = <<~PARK
    __AA1234_____#__
    _$______________
    _________%BB1234
    __&_____________
    PARK
    drone_park = DronePark.new(park_map)

    expect(drone_park.search('$')).to eq []
    expect(drone_park.search('#')).to eq []
  end

  it '3. Uma demarcação com 2 drones' do
    park_map = <<~PARK
    ______________$___
    ___AA1234_________
    ______&___________
    _*____BB1234______
    _____________%____
    ____$_____________
    PARK
    drone_park = DronePark.new(park_map)

    expect(drone_park.search('&')).to eq ['AA1234', 'BB1234']
  end

  it '4. O mesmo drone só é listado uma vez' do
    park_map = <<~PARK
    _________%__@_____
    ___AA1234______$__
    ______@___________
    __%BB1234@________
    ____________!_____
    PARK

    drone_park = DronePark.new(park_map)

    expect(drone_park.search('@')).to eq ['AA1234', 'BB1234']
    expect(drone_park.search('%')).to eq ['BB1234']
  end

  it '5. Retorna todas as placas quando busca é vazia' do
    park_map = <<~PARK
    __GH3847@_____________AE3847___
    ___________IR3847%___%__&VV3984
    HH3847_________JS8349__________
    ____AS2378_____________________
    __VF3489___________KA8934______
    ____UU3489@LL3489__$___________
    ______________SS3489___________
    __UU3478#_______________#NN3489
    ____________%__CC3478__________
    WA2389________________$________
    __________#________JJ3489$_____
    __XX3487______________ZZ5279___
    PARK

    drone_park = DronePark.new(park_map)

    expect(drone_park.search('*')).to eq []
    expect(drone_park.search('#')).to eq ["NN3489", "UU3478"]
    expect(drone_park.search('%')).to eq ["IR3847", "JS8349"]
    expect(drone_park.search('@')).to eq ["GH3847", "LL3489", "UU3489"]
    expect(drone_park.search('$')).to eq ["JJ3489", "KA8934", "SS3489", "ZZ5279"]
    expect(drone_park.search('')).to eq ["AE3847", "AS2378", "CC3478", "GH3847",
                                         "HH3847", "IR3847", "JJ3489", "JS8349",
                                         "KA8934", "LL3489", "NN3489", "SS3489",
                                         "UU3478", "UU3489", "VF3489", "VV3984",
                                         "WA2389", "XX3487", "ZZ5279"]
  end
end
