# Aspectos Técnicos

## Estrutura do Projeto
A estrutura do projeto é baseada em três componentes principais: linguagem Haskell, implementação de árvores e uso do Cabal. Haskell é uma linguagem de programação funcional que permite a criação de programas com um alto nível de abstração e elegância, ao mesmo tempo que garante a segurança e confiabilidade do código. As árvores são uma estrutura de dados fundamental em Haskell e são usadas no projeto para modelar as possíveis respostas do jogo de adivinhação. Cabal é uma ferramenta para gerenciamento de dependências e compilação de pacotes Haskell. Ele é usado para gerenciar as dependências do projeto Haskellator Heroes e para construir o front-end do jogo. A combinação desses componentes cria uma base sólida para o projeto Haskellator Heroes, permitindo a criação de um jogo divertido que desafia os jogadores a pensar e aprender sobre árvores e programação funcional.


## Funções Importantes

### Hero.hs
<p align = "center"> <img src="assets/tecnicoherois.jpeg"/> </p>


Este é um módulo em Haskell chamado Hero que contém duas definições de tipos e uma lista de heróis com suas características.

A primeira definição de tipo é Hero, que representa os heróis do jogo. Ele é definido como uma soma de tipos, usando o operador |. Cada herói é um valor construtor que pode ser usado em outras partes do código. O valor InvalidAnswer é incluído na soma de tipos para lidar com respostas inválidas ou desconhecidas.

A segunda definição de tipo é Characteristic, que representa as características dos heróis. É definido como uma soma de tipos, semelhante ao tipo Hero.

A lista heroCharacteristics é um dicionário que associa cada herói com um conjunto de características. Cada herói é mapeado para uma lista de características usando a função heroCharacteristics.

Cada herói tem uma lista de características específicas. Por exemplo, Batman tem a característica Arma, Superman tem as características Voa, SuperForça, SuperSentidos e FatorDeCura, e assim por diante. A lista de heróis e suas características pode ser expandida ou modificada para se adequar a diferentes jogos ou necessidades.

Essas definições são úteis para criar um sistema de perguntas e respostas que permita adivinhar o herói em que o usuário está pensando com base em suas características. Por exemplo, se o usuário responde que o herói pode voar, o sistema pode excluir todos os heróis que não possuem a característica Voa e continuar fazendo perguntas até que reste apenas um herói.


### Tree.hs

<p align = "center"> <img src="assets/tecnicoarvore.jpeg"/> </p>

O módulo Tree define uma estrutura de dados de árvore (Tree), que é usada para representar as perguntas e respostas do jogo. A árvore é composta de nós (Node) e folhas (Leaf). Cada nó contém uma pergunta (representada como uma string) e duas sub-árvores, que são as possíveis respostas para a pergunta. Cada folha contém uma resposta (representada como um valor do tipo Hero) para o jogo.

O tipo de dados Tree é parametrizado com um tipo a, o que significa que a árvore pode conter qualquer tipo de valor, desde que esse tipo implemente a interface do tipo de dados Tree. No caso do jogo de adivinhação de heróis, a árvore contém valores do tipo Either String Hero, que representa uma resposta ou uma pergunta.

O módulo Tree importa o módulo Hero, que define os tipos de dados Hero e Characteristic, que são usados para representar os heróis e suas características. A árvore é construída manualmente, usando os construtores de dados Node e Leaf, e contém uma série de perguntas que são usadas para adivinhar qual herói o jogador está pensando.

A construção da árvore é baseada na ideia de divisão e conquista, onde cada pergunta é usada para dividir o conjunto de possíveis heróis em duas sub-árvores, cada uma contendo um subconjunto de heróis que atendem à resposta para a pergunta. As perguntas são organizadas de tal forma que as que possuem maior poder de discriminação são colocadas no topo da árvore. Isso significa que as perguntas que dividem o conjunto de heróis em duas partes mais desiguais são colocadas em nós mais altos da árvore, enquanto as perguntas que têm menos poder de discriminação são colocadas em nós mais baixos da árvore.

<p align = "center"> <img src="assets/tecnico.jpeg"/> </p>


runGame é uma função que implementa a lógica do jogo de adivinhação de heróis. Ela recebe como entrada uma árvore Tree com as perguntas e respostas possíveis, e retorna o herói correspondente à sequência de perguntas e respostas dadas pelo jogador.

A função começa verificando se o nó atual é uma Leaf que contém uma mensagem de erro ou um herói. Se for uma mensagem de erro, ela imprime a mensagem na tela e chama a função runGame novamente com a árvore original tree. Se for um herói, ela retorna o herói correspondente.

Caso contrário, se o nó atual for um Node com uma pergunta, a função imprime a pergunta na tela e lê a resposta do jogador usando a função getLine. Dependendo da resposta ("sim" ou "não"), a função chama runGame recursivamente com o nó à esquerda ou à direita da árvore.

Se a resposta do jogador não for "sim" ou "não", a função retorna o valor InvalidAnswer, que é definido como um herói inválido no módulo Hero.