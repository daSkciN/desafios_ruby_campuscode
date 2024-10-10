require 'spec_helper'

describe TheLastOfUs do
  it '1. Avalia mapa e trajeto, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 0,0
                  Shopping: -3,0
                  Praça: -4,0
                CITYMAP
    paths = <<~PATHS
             Shopping -> Praça
            PATHS
    infection_rate = 5

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Shopping -> Praça, com 20 de nível de infecção'
    )
  end

  it '2. Avalia mapa e trajeto, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 2,1
                  Restaurante: 2,3
                  Bar: 2,2
                CITYMAP
    paths = <<~PATHS
             Bar -> Restaurante -> Base
            PATHS
    infection_rate = 15

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Bar -> Restaurante -> Base, com 30 de nível de infecção'
    )
  end

  it '3. Avalia mapa e trajeto, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 0,0
                  Shopping: -3,0
                  Praça: -4,0
                  Supermercado: 2,0
                CITYMAP
    paths = <<~PATHS
             Shopping -> Praça -> Base -> Supermercado
            PATHS
    infection_rate = 5

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Shopping -> Praça -> Base -> Supermercado, com 30 de nível de infecção'
    )
  end

  it '4. Avalia mapa e trajeto, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: -2,-2
                  Lago: 5,-2
                  Monumento: -2,5
                  Farmácia: 0,5
                  Mercado: 0,-2
                CITYMAP
    paths = <<~PATHS
             Lago -> Base -> Monumento -> Farmácia -> Mercado
            PATHS
    infection_rate = 3

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Lago -> Base -> Monumento -> Farmácia -> Mercado, com 69 de nível de infecção'
    )
  end

  it '5. Avalia mapa e trajetos, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 0,0
                  Banco: 2,0
                  Hospital: -1,3
                  Mercado: 2,3
                  Parque: -1,2
                  Praça: 0,3
                  Beira-rio: -1,0
                CITYMAP
    paths = <<~PATHS
             Banco -> Mercado -> Praça
             Beira-rio -> Parque -> Hospital -> Praça -> Base
            PATHS
    infection_rate = 4

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Beira-rio -> Parque -> Hospital -> Praça -> Base, com 16 de nível de infecção'
    )
  end

  it '6. Avalia mapa e trajetos, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 2,2
                  Banco: 2,5
                  Hospital: 4,5
                  Mercado: 0,2
                  Parque: 1,2
                  Praça: 4,2
                  Beira-rio: 3,2
                CITYMAP
    paths = <<~PATHS
             Beira-rio -> Praça -> Hospital -> Banco
             Beira-rio -> Praça -> Base -> Mercado -> Parque
             Parque -> Base -> Mercado -> Praça -> Beira-rio
           PATHS
    infection_rate = 10

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Beira-rio -> Praça -> Base -> Mercado -> Parque, com 50 de nível de infecção'
    )
  end

  it '7. Avalia mapa e trajetos, retorna o menor caminho e seu nível de infecção' do
    city_map = <<~CITYMAP
                  Base: 0,0
                  Banco: 4,0
                  Hospital: 0,5
                  Mercado: 0,4
                  Parque: 4,1
                  Praça: -2,0
                  Beira-rio: 2,1
                  Shopping: 2,0
                  Farmácia: 3,0
                  Lago: 1,0
                CITYMAP
    paths = <<~PATHS
             Banco -> Parque -> Lago -> Beira-rio
             Hospital -> Mercado
             Praça -> Base -> Shopping -> Farmácia
            PATHS
    infection_rate = 5

    expect(TheLastOfUs.new(city_map, paths, infection_rate).infection_monitoring).to eq(
      'O melhor trajeto é Praça -> Base -> Shopping -> Farmácia, com 25 de nível de infecção'
    )
  end
end