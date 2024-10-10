# Super Smash Campus

Novo jogo do momento, Super Smash Campus é um jogo de ação disponível nos principais consoles portáteis. Nesse jogo, diversos personagens da cultura popular podem treinar e se enfrentar em batalhas buscando aperfeiçoar suas próprias habilidades.

Uma aventura começa com a escolha de um personagem, que possui:
- Um nome, representado por `name`;
- Uma quantidade de experiência, representada por `exp`;
- Um nível, representado por `level`. Cada 10 pontos de experiência que um personagem possui, equivalem a um nível, ou seja, se um personagem possui 50 pontos de experiência, então ele está no nível 5.

Ao lutar, um personagem ganha experiência baseado no nível de seu oponente e no resultado da luta:

- Caso um personagem vença uma luta contra um oponente de mesmo nível, este personagem ganha 100 de experiência;
- Caso um personagem vença uma luta contra um oponente de nível maior que o dele, ganha os 100 anteriormente mencionados e mais alguns conforme a regra que segue. Para cada ponto de diferença entre os níveis dos participantes, o vencedor ganha um adicional de 5 pontos de experiência. Ou seja, se um personagem de nível 1 derrota um personagem de nível 11, ele deve receber 100 pontos de experiência pela vitória mais 50 pontos pela diferença de níveis;
- Caso um personagem vença uma luta contra um oponente de nível menor que o dele, os 100 pontos de experiência obtidos de uma vitória serão diminuídos em 5 para cada nível de diferença. Dessa forma, se um personagem de nível 11 derrota um personagem de nível 1, este personagem obterá apenas 50 pontos de experiência, pois terá 50 pontos deduzidos dos 100 obtidos com uma vitória. A dedução de pontos não pode passar de 100 pontos deduzidos.

Ao perder uma luta, um personagem também obtêm experiência:

- Ao perder uma luta contra um oponente de mesmo nível, este personagem ganha 50 de experiência;
- Ao perder uma luta contra um oponente de nível maior que o dele, um personagem ganha, além de 50 pontos, um adicional de 5 pontos para cada nível de diferença entre ele e seu adversário. Dessa forma, se um personagem de nível 1 perde contra um personagem de nível 11, ele obterá 100 pontos de experiência;
- A regra anterior é invertida caso um personagem perca uma luta contra um oponente de nível menor que o dele, com os pontos de experiência obtidos sendo diminuídos em 5 para cada nível de diferença. Dessa forma, se um personagem de nível 11 perde para um personagem de nível 1, este personagem não obterá nenhum ponto de experiência, pois terá 50 pontos deduzidos dos 50 pontos inicialmente obtidos. A dedução de pontos não pode passar de 50 pontos deduzidos.

Arcos de treino são mais simples, com personagens ganhando experiência baseado no regime de treino que escolheu. 

Nesse desafio, você deverá acompanhar a trajetória de personagens enquanto eles passam por um regime de lutas e treinos. Você implementará a classe `SuperSmashCampus`, a qual receberá um array `combatants`, o qual possui objetos `Combatant` que representa os personagens, que possuem um nome `name` e uma quantidade inicial de experiência `exp`. Ela também receberá a string `events`, relatando todos os eventos pelos quais esses personagens passaram durante sua aventura. Seu código deverá retornar, ao final de todos os eventos, um sumário sobre os personagens, da forma como está descrita no arquivo de testes.

#### AVISO

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.