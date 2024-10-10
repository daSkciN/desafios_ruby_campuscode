# O último de Nós

Numa cidade avassalada por um vírus, os habitantes precisam se revezar para buscar suprimentos enquanto tentam se manter livres da infecção transmitida pelo ar. Entre esses habitantes, temos John, o mais capacitado de seu grupo de sobreviventes, que deve constantemente colocar sua vida em risco para manter o pequeno grupo vivo, enquanto buscam melhorias para controlar o nível de infecção causada pelo vírus.

Até o momento, algumas descobertas foram feitas em relação ao vírus. Uma delas é a carga viral necessária para infectar seres humanos e como monitorá-la, o que permite que sobreviventes possam medir a carga viral de seus corpos e entender quanto tempo eles podem ficar expostos ao vírus antes do processo de contágio se tornar irreversível. Também descobriram como diminuir a infecção por um tempo, porém, como esta tecnologia ainda é nova e limitada, só pode ser administrada na base onde os sobreviventes ficam unidos e não pode ser levada em suas expedições por recursos.

Neste desafio, você deverá trabalhar com a equipe de monitoramento de infecção para determinar as melhores estratégias que John deve seguir em sua busca por suprimentos na cidade, de forma a minimizar o impacto do vírus em seu corpo. Você receberá os planos de ação da equipe de desbravamento na forma da string `paths`, que contém o caminho que John deve seguir ao buscar suprimentos. `paths` pode conter um ou mais caminhos e é sua responsabilidade determinar qual caminho deixará John com a menor quantidade de vírus no corpo.

Além disso, você também receberá a string `city_map`, representando o mapa da cidade com coordenadas para cada um dos lugares de interesse que John deve passar. Por fim, também receberá o índice de carga viral do ar em forma da variável `infection_rate`. Esse índice indica o aumento do nível de infecção que o corpo de John absorverá a cada 1 unidade de distância que ele se move.

Você deve retornar uma string que contém informações sobre o estado de John ao seguir o caminho que garante menos dano a ele. Note que, como na Base de Sobreviventes temos maneiras de controlar o vírus, se John passa pela Base durante o caminho, a carga viral em seu corpo é reduzida pela metade. Além disso, assuma que todos os caminhos começam na Base.

## Exemplo

Assuma a entrada do método com 

```
    city_map = <<~CITYMAP
                Base: 0,0
                Shopping: -3,0
                Praça: -4,0
                Supermercado: 2,0
              CITYMAP
    paths = <<~PATHS
              Shopping -> Praça -> Base -> Supermercado
            PATHS
    infection_rate = 5
```

Como a variável `paths` possui apenas um caminho, é com ele que trabalharemos. Ao iniciar na Base, com coordenada [0,0], John deve ir para o Shopping na coordenada [-3,0]. Esse caminho tem distância 3 e, portanto, o índice de infecção de John sobe para 15, pois `infection_rate` cita que o índice aumenta em 5 para cada unidade de distância. Do Shopping, John deve ir para a Praça na coordenada [-4,0], aumentando seu nível de infecção para 20. Na sequência, deve ir para Base, em [0,0]. Ao chegar na Base, seu nível de infecção estaria em 40, mas com os cuidados médicos na Base, seu nível cai pela metade, ou seja, para 20.

Por fim, ao ir ao Supermercado, John finalizaria esse trajeto com nível viral em 30.

## Informações adicionais

- A distância entre um ponto A = [x1, y1] e B = [x2, y2] é dada por: √((x2-x1)²+(y2-y1)²)

## Links úteis

- Sobre Heredoc: https://campuscode.com.br/conteudos/usando-heredoc-em-ruby

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes.

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
