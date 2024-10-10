# Solucionador de Tarefas de Casa

Luffy sempre foi um aluno inteligente, mas, com a rotina corrida, resolver listas extensas de exercícios de matemática estava se tornando uma tarefa árdua. Então, ele teve uma ideia brilhante: "E se eu criar um programa que lê as questões de um arquivo e me dá as respostas automaticamente?". 

E é exatamente isso que você vai fazer neste desafio!

Você deve implementar a classe chamada `HomeworkSolver`. A classe deve ter um método chamado `solve` que, quando chamado, lê o arquivo de exercícios, resolve cada operação matemática e grava as respostas, uma por linha, em um arquivo de saída. O caminho para este arquivo de saída é passado como argumento para o método `solve`.

## Detalhes adicionais:

- Você vai precisar usar o método `File.open` para manipular arquivos neste desafio também. Consulte a [documentação](https://ruby-doc.org/core-2.7.2/File.html#method-c-open) para saber mais sobre esse e outros métodos.
  
- Em Ruby, você pode usar a estrutura `HEREDOC` para criar strings multilinha. Isso é útil, especialmente para testes onde você deseja comparar o resultado com uma string de várias linhas. Nas nossas expectativas dos testes, nomeamos como `VARIABLE`. Caso queira saber mais sobre como usar `HEREDOC` em Ruby, aqui está um [artigo da Campus Code](https://www.campuscode.com.br/conteudos/usando-heredoc-em-ruby).
