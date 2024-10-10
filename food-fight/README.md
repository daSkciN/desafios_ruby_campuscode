
# Guerra de comida!

Considere o seguinte enredo para um jogo de fantasia:

> No planeta Selv-selv, os habitantes são comidas de diferentes origens culinárias e
vivem em constante conflito para saber quem é a melhor. Para descobrir isso,
engajam em grandes batalhas todos contra todos.

Neste jogo, as batalhas entre personagens são representadas por uma série de
registros de entradas :

```ruby
SPAGHETTOMON ataca SUSHIMON
PAMONHAMON cura SUSHIMON
SPAGHETTOMON ataca SUSHIMON
```

Os personagens são definidos por [hashes](https://ruby-doc.org/core/Hash.html) com os atributos de cada um deles:

```ruby
{ "SPAGHETTOMON":  ["italiana", 10, 200],
  "PAMONHAMON":  ["junina", 12, 160],
  "SUSHIMON": ["japonesa", 15, 150] }
```

A chave identifica o nome da comida e os valores no array representam
respectivamente sua origem, força e vida máxima.

Neste desafio, você deve implementar o código para instanciar personagens,
processar os dados de entrada das batalhas e retornar os registros de saída com o
resultado de cada batalha. No exemplo acima, o retorno seria:

```ruby
SPAGHETTOMON => SUSHIMON: 150 - 15 => 135
PAMONHAMON => SUSHIMON: 135 + 12 => 147
SPAGHETTOMON => SUSHIMON: 147 - 15 => 132
```

Considere que os tipos de culinária têm resistências e fraquezas contra outros
tipos. Neste jogo, comida italinana é forte contra japonesa, mas é fraca contra
junina; comida japonesa é forte contra junina, mas é fraca contra italiana; já
comida junina é forte contra italiana, mas fraca contra japonesa.

Observação: será necessário que o código seja capaz de lidar com arredondamento
de números. Você pode consultar a documentação oficial da linguagem Ruby de
programação, mas também recomendamos a leitura do seguinte artigo: [Arredondando
números em Ruby](https://campuscode.com.br/conteudos/arredondando-numeros-em-ruby-com-os-metodos-ceil-floor-e-round).


## Links úteis:

- [Usando Heredoc em Ruby](https://campuscode.com.br/conteudos/usando-heredoc-em-ruby)

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
