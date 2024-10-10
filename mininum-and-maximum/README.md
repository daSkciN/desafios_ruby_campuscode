# Palavras e Números, Máximos e Mínimos

Neste desafio, você deve implementar o código de um método que receba uma *string*
com palavras e números, analise esses dados comparando os valores e a quantidade
de caracteres das palavras e retorne a palavra mais longa ou o número de maior
valor, além da palavra mais curta ou número de menor valor. Por exemplo:

```
'bola desafio 1 5 3'
```

Retorna:

```
'Mínimo: 1; Máximo: desafio'
```

Em caso de empate entre uma palavra e um número, isto é, se a palavra mais longa tiver tamanho igual ao maior número na string ou a palavra mais curta tiver tamanho igual ao menor número na string, será necessário um desempate.

Vamos analisar o exemplo abaixo:

```
`fone 4 bala palavra 200`
```

Nesse exemplo, `fone`, `bala` e `4` empatam como o mínimo dessa string. Para determinar qual desses elementos deve ser retornado, devemos considerar a composição de cada um deles: caso uma palavra tenha letras repetidas, ela ganha o desempate. Se nenhuma das palavras do empate tiver letras repetidas, o número deve ser retornado.

No exemplo acima, temos:

- `fone`: não possui letras repetidas;
- `bala`: letra `a` repete;
- número `4`. 

De acordo com o critério de desempate, a palavra `bala` deve ser retornada.

Portanto, com a entrada descrita acima, seu código deve retornar:

```
`Mínimo: bala; Máximo: 200`
```
