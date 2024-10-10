# Lendo e Convertendo Binários

Este desafio envolve a leitura e conversão de números binários. Há dois aspectos principais no desafio:

1. **Conversão de Binários**: você deve implementar uma classe chamada `BinaryConverter` que será responsável por converter strings binárias em números inteiros. Essa classe deve ter um método `to_integer` que recebe uma string binária e retorna seu equivalente decimal.

2. **Leitura e Cálculo de Arquivos**: uma segunda classe chamada `FileCalculator` deve ser implementada. Esta classe será responsável por ler um arquivo que contém várias strings binárias, converter cada uma delas em seu valor decimal e, em seguida, somar todos esses valores. Se uma string binária for inválida, ela deve ser ignorada. Esta classe deve ter um método `convert` que recebe o caminho de um arquivo e retorna a soma dos valores válidos contidos nele.

## Detalhes adicionais:

- Você vai precisar usar o método `File.open` para manipular arquivos. Consulte a [documentação](https://ruby-doc.org/core-2.7.2/File.html#method-c-open) para saber mais sobre esse e outros métodos.
- Uma string binária válida contém apenas os caracteres '0' e '1'. Qualquer outro caractere torna a string inválida.
- Não misture as responsabilidades das classes. `BinaryConverter` deve se concentrar apenas na conversão de binários, enquanto `FileCalculator` deve lidar com a leitura de arquivos e cálculo.
