# Grumpy Drumpy amassa latas

Grumpy Drumpy estava sentado no telhado de sua casa, observando os duendes
construírem a casa de latas, ao lado da casa de doces da bruxa malvada. Sempre
muito ranzinza, Grumpy resolveu brincar de amassar as latas dos muros jogando
pedras em cima deles!

Sempre que jogava uma pedra, ela quebrava um pouco e amassava uma lata. Quando 
uma lata no topo do muro era completamente esmagada, a lata logo abaixo dela 
começava a ser amassada.

Neste desafio você deve implementar o código que recebe a configuração de um
muro de latas e a sequência de pedras arremessadas, retornando o estado
final do muro.

Considere que o muro é representado por uma matriz de arrays com números
inteiros, que representam a resistência da lata localizada naquela posição:

```ruby
wall_of_cans = [[1,2,5],
                [3,5,2],
                [4,2,1]]
```

Cada pedra é representada por um número inteiro e o valor equivale a seu
tamanho. Toda vez que uma pedra atinge uma lata, ela quebra e dela é subtraído o
valor de resistência da lata.

Se uma pedra de tamanho `3` é arremessada na coluna `1` do muro, ela esmaga
completamente a primeira lata de resistência 2 e atinge a segunda lata de valor
`5` deixando essa lata com `4` de resistência. Assim, a configuração final do
muro seria:

```ruby
result = [[1,0,5],
          [3,4,2],
          [4,2,1]]
```

A sequência de pedras arremessadas é definida por um array de arrays, onde o
primeiro número representa o tamanho da pedra e o segundo número indica a coluna
do muro em que a pedra cai. Por exemplo:

```ruby
rocks = [[3,1],
         [2,2]]
```

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
