# Movimentos de Xadrez

Nesse desafio, você terá que trabalhar com algumas regras básicas do xadrez para aperfeiçoar seu conhecimento com manipulação espacial. Você terá que implementar dois métodos:

1 - O primeiro método é `valid_movements`, que receberá o array `piece_movements` contendo um conjunto de strings que representam movimentos que pretendem ser realizados com uma peça específica. Esse método deve retornar, para cada movimento descrito, um indicador se aquele movimento é válido ou não, de acordo com o arquivo de testes. Um exemplo:

```
pieces = [
          'Peão branco, f4 -> f3',
          'Peão preto, f4 -> f3',
         ]
```

O retorno de `valid_movements` com esses dados de entrada deve ser `[Inválido, Válido]`. No caso do peão branco, ir de f4 para f3 significa que ele estaria andando 'para trás', o que não é permitido pelas regras do xadrez. O peão preto, por outro lado, está andando uma casa para a frente na direção vertical e, portanto, apresenta um movimento válido.

Para esse método, você deve considerar que não há nenhuma outra peça no tabuleiro além da peça que está sendo movimentada.

2 - O segundo método é `possible_captures` que receberá um array `board` contendo strings que representam peças no tabuleiro. Seu método deve retornar, dentre as peças em `board`, quais delas podem capturar umas as outras. No exemplo:

```
board = [
          'Torre branca, b4',
          'Torre preta, b2',
          'Rainha preta, c5'
        ]
```

O método deve retornar ['Torre preta, b2 -> Torre branca, b4', 'Torre branca, b4 -> Torre preta, b2', 'Rainha preta, c5 -> Torre branca, b4'] pois as torres estão na mesma horizontal e a rainha preta está na mesma diagonal que a torre branca, permitindo sua captura.

Para esse método, considere que, para cada par de peças em `board` que estiver analisando, apenas as duas peças estão no tabuleiro.

## Outras informações

Notação algébrica: https://www.chess.com/pt-BR/article/view/notacao-de-xadrez-a-linguagem-do-xadrez
Regras de movimentação no xadrez: https://www.chess.com/pt-BR/blog/L4wKov/movimento-das-pecas-no-xadrez

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.