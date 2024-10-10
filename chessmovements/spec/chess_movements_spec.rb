require 'spec_helper'

describe ChessMovements do
  context 'Validação de movimentos' do
    it '1. Recebe peões e suas intenções de movimento e retorna se movimentos são válidos' do
      piece_movements = [
                          'Peão branco, b4 -> b5',
                          'Peão branco, f4 -> f3',
                          'Peão preto, f4 -> f3',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Válido', 'Inválido', 'Válido'])
    end

    it '2. Recebe torres e suas intenções de movimentos e retorna se movimentos são válidos' do
      piece_movements = [
                          'Torre preta, a8 -> h8',
                          'Torre branca, d4 -> e5',
                          'Torre preta, f8 -> f3',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Válido', 'Inválido', 'Válido'])
    end

    it '3. Recebe reis e suas intenções de movimento e retorna se movimentos são válidos' do
      piece_movements = [
                          'Rei preto, a2 -> a1',
                          'Rei branco, f3 -> g4',
                          'Rei preto, b4 -> b6',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Válido', 'Válido', 'Inválido'])
    end

    it '4. Recebe bispos e suas intenções de movimento e retorna se movimentos são válidos' do
      piece_movements = [
                          'Bispo preto, g1 -> g2',
                          'Bispo preto, e8 -> a4',
                          'Bispo preto, g1 -> h3',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Inválido', 'Válido', 'Inválido'])
    end

    it '5. Recebe rainhas e suas intenções de movimentos e retorna se movimentos são válidos' do
      piece_movements = [
                          'Rainha branca, c3 -> f7',
                          'Rainha preta, a8 -> h1',
                          'Rainha branca, h5 -> e6',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Inválido', 'Válido', 'Inválido'])
    end

    it '6. Recebe cavalos e suas intenções de movimento e retorna se movimentos são válidos' do
      piece_movements = [
                          'Cavalo branco, a1 -> b3',
                          'Cavalo preto, d8 -> f7',
                          'Cavalo preto, f7 -> e5',
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(['Válido', 'Válido', 'Válido'])
    end

    it '7. Recebe diferentes peças e suas intenções de movimento e retorna se movimentos são válidos' do
      piece_movements = [
                          'Cavalo branco, a1 -> b3',
                          'Rainha branca, d8 -> f7',
                          'Bispo preto, e8 -> a4',
                          'Cavalo preto, f7 -> e5',
                          'Torre preta, f8 -> f3'
                        ]

      expect(ChessMovements.valid_movement(piece_movements)).to eq(["Válido", "Inválido", "Válido", "Válido", "Válido"])
    end

  end

  context 'Perigo de captura' do
    it '1. Recebe um conjunto de peças e deve retornar quais delas podem ser capturadas' do
      board = [
        'Peão branco, b4',
        'Peão branco, b3',
        'Peão preto, b5',
        'Peão branco, a3',
        'Peão preto, a5',
        'Peão preto, c4'
      ]
      captures = ChessMovements.possible_captures(board)

      expect(captures).to include('Peão branco, b4 -> Peão preto, a5')
      expect(captures).to include('Peão branco, b3 -> Peão preto, c4')
      expect(captures).to include('Peão preto, a5 -> Peão branco, b4')
      expect(captures).to include('Peão preto, c4 -> Peão branco, b3')
      expect(captures.size).to eq 4
    end

    it '2. Recebe um conjunto de peças e deve retornar quais delas podem ser capturadas' do
      board = [
        'Rainha preta, f7',
        'Torre branca, f2',
        'Peão branco, b7',
        'Torre branca, g1'
      ]
      captures = ChessMovements.possible_captures(board)

      expect(captures).to include ('Rainha preta, f7 -> Torre branca, f2')
      expect(captures).to include ('Rainha preta, f7 -> Peão branco, b7')
      expect(captures).to include ('Torre branca, f2 -> Rainha preta, f7')
      expect(captures.size).to eq 3
    end

    it '3. Recebe um conjunto de peças e deve retornar quais delas podem ser capturadas' do
      board = [
        'Torre preta, e2',
        'Bispo branco, h5',
        'Bispo preto, a6',
        'Rainha branca, g8',
        'Rainha preta, b8',
        'Torre branca, c1',
        'Cavalo preto, h3',
        'Cavalo branco, e3',
        'Rei branco, b1',
        'Rei preto, b2'
      ]
      captures = ChessMovements.possible_captures(board)

      expect(captures.size).to eq 8
      expect(captures).to include("Rei preto, b2 -> Rei branco, b1")
      expect(captures).to include("Rei branco, b1 -> Rei preto, b2")
      expect(captures).to include("Rei preto, b2 -> Torre branca, c1")
      expect(captures).to include("Rainha preta, b8 -> Rei branco, b1")
      expect(captures).to include("Rainha preta, b8 -> Rainha branca, g8")
      expect(captures).to include("Rainha branca, g8 -> Rainha preta, b8")
      expect(captures).to include("Bispo branco, h5 -> Torre preta, e2")
      expect(captures).to include("Torre preta, e2 -> Cavalo branco, e3")
    end
  end
end