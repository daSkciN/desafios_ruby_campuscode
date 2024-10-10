# Enfileirando Cinéfilos

Rafael é um grande cinéfilo e está sempre motivando seus amigos a irem ao
cinema. Sempre que um grupo vai, os amigos precisam escolher os assentos e
quem senta ao lado de quem. Em alguns casos, essa simples escolha pode ser
um desafio. As pessoas podem ter preferências difíceis de conciliar: gostam de
se sentar no meio da fileira, não gostam de sentar ao lado de alguém em
específico, sempre sentam à direita ou à esquerda de uma pessoa, entre outras
peculiaridades.

Neste desafio, você deve implementar o código de um algoritmo que recebe todas as
regras impostas por um grupo de amigos e retorna um Array com a com o nome das 
pessoas na ordem que elas deveriam se sentar respeitando todas as regras.

Considere que elas sempre vão sentar na mesma fileira e que a quantidade de 
assentos na fileira é sempre igual à quantidade de pessoas presente na lista de 
regras.

## Exemplo

Considere a seguinte lista de regras:

```ruby
PEDRO sempre senta no meio
MARINA senta à direita de MAX
```

Na lista de regras vemos o nome de 3 pessoas: PEDRO, MARINA e MAX.
Dadas as duas regras para organizá-las na fileira do cinema, o
algoritmo deve retornar:

```ruby
['MAX', 'PEDRO', 'MARINA']
```

Considere que o "meio" da fileira são todos os assentos que não estão nas
extremidades.

Neste caso há apenas uma combinação possível que respeita todas as regras. Caso
exista mais de uma, todas as combinações possíveis devem ser retornadas.

## Links úteis:

- [Usando Heredoc em Ruby](https://campuscode.com.br/conteudos/usando-heredoc-em-ruby)
- [Array](https://ruby-doc.org/core/Array.html)

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes. 

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
