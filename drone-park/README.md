# Parque de Drones

Em um futuro não muito distante, quando o ambiente já se encontra devastado pelas
mudanças climáticas, Heron Dusk tem o monopólio de drones pessoais, utilizados
por cada indivíduo para se deslocar pelo que resta do planeta. As áreas 
para estacionar os veículos voadores são limitadas e disputadíssimas.

Nos parques que sobraram, há áreas demarcadas com símbolos que indicam os locais 
onde não é permitido pousar veículos. No entanto, na nova ordem mundial, reina o 
caos e as pessoas deixam seus drones parados onde bem entendem. Por isso, Dusk precisa
elaborar um sistema que identica cada um dos drones parados em locais proibidos.

Considere o mapa do parque abaixo:

```shell
___AA1234____
____________#
___BB1234%___
```

No mapa há dois drones estacionados indicados pelas suas placas de
identificação: `AA1234` e `BB1234`. Também há dois pontos demarcados com os
símbolos `#` e `%`. Cada símbolo indica um ponto onde drones não podem ser
estacionados. Drones estacionados imediatamente acima, abaixo ou ao lado de um
símbolo devem ser multados! Note que um drone estacionado na diagonal de um
símbolo não precisa ser multado, como no exemplo:

```shell
___AA1234____
__#__________
____BB1234___
____$________
```

O drone `AA1234` não está estacionado em local proibido, mas `BB1234` está, por
causa do símbolo `$`.

Neste desafio você deve ajudar Dusk a implementar um algoritmo que lê o mapa de
um parque identificando os drones e as marcações de locais proibidos com
símbolos. O código deve implementar um método `search` que recebe uma string com
um símbolo e retorna todas as placas de drones que estiverem estacionados
irregularmente em relação a esse ponto. Por exemplo:

```ruby
park_map = <<~PARK
___AA1234____
__#__________
____BB1234___
____$________
PARK

DronePark.new(park_map).search('$')
# => Retorna ['BB1234']

DronePark.new(park_map).search('#')
# => Retorna []
```

## Links úteis:

- [Usando Heredoc em Ruby](https://campuscode.com.br/conteudos/usando-heredoc-em-ruby)


**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
