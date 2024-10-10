# Artista ASCII

Ksyban é um artista digital ainda desconhecido que está procurando espaço no
meio artístico. Suas obras mais recentes utilizam símbolos para elaborar
pinturas digitais. Ele utiliza [hashes](https://ruby-doc.org/3.2.2/Hash.html)
para definir com diferentes símbolos as áreas que vai pintar, por exemplo:

```ruby
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
```

Com as instruções da hash acima, Ksyban indica que a pintura deve ter um
retângulo com símbolo `%` de dimensões 3 por 2 (altura por largura) com a ponta
esquerda superior localizada na coordenada `0, 0` de uma matriz.
Em seguida, a instrução indica que deve ser pintado outro retângulo de dimensão
4 por 2, com o símbolo `@`, e ponta esquerda superior na coordenada `1, 5` da
mesma matriz. Aplicando cada etapa dessas instruções, a pintura ficará assim:

```ruby
%%.....
%%...@@
%%...@@
.....@@
.....@@
```

Os `.` indicam áreas que não foram pintadas.

Ksyban utiliza combinações de símbolos como se fossem cores, ou seja, dois
símbolos diferentes se transformam em outro quando combinados. As regras de
combinação seguem abaixo:

```
@ + * = %
@ + % = &
@ + & = *
* + % = &
* + & = @
% + & = *
```

Neste desafio você deve implementar o código que recebe uma hash de instruções
para pinturas e retorna a tela final pintada com símbolos.

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
