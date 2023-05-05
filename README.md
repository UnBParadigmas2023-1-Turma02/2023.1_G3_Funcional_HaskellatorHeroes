# Haskellator Heroes

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T02 <br>
**Nro do Grupo (de acordo com a Planilha de Divisão dos Grupos)**: 03<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| Adrian Soares Lopes | 160000572 |
| Bianca Sofia Brasil de Oliveira | 190025298 |
| Daniel Vinicius Ribeiro Alves | 190026375 |
| Daniela Soares de Oliveira | 180015222 |
| Eduardo Maia Rezende | 180119231 |
| Erick Melo Vidal de Oliveira | 190027355 |
| João Victor Max Bisinotti de Oliveira | 170069991 |
| Klyssmann Henrique Ferreira de Oliveira | 202028202 |
| Vitor Eduardo Kühl Rodrigues | 190118288 |

## Sobre 
Olá e bem-vindo ao mundo do Haskellator Heroes!

Haskellator Heroes é um jogo de adivinhação em Haskell que desafia você a pensar em um herói fictício e adivinhar quem é com o menor número possível de perguntas. É um jogo divertido e viciante que usa uma árvore binária de decisão para modelar as possíveis respostas e tornar a experiência do jogador única a cada rodada.

Com uma interface amigável e fácil de usar, Haskellator Heroes é adequado para jogadores de todas as idades e habilidades. O sistema inteligente de adivinhação fará perguntas de múltipla escolha, testando seus conhecimentos sobre seus heróis favoritos e ajudando você a escolher o caminho certo para descobrir o herói escolhido.

Além disso, Haskellator Heroes é uma ótima maneira de aprender sobre programação funcional em Haskell. O jogo é projetado para apresentar conceitos de programação, como árvores binárias de decisão, de uma maneira divertida e interativa. Com Haskellator Heroes, você pode aprender enquanto se diverte!

Não espere mais, jogue Haskellator Heroes hoje mesmo e desafie-se a adivinhar o herói fictício com o menor número possível de perguntas. Divirta-se enquanto aprende sobre programação funcional e teste seus conhecimentos sobre seus heróis favoritos. Jogue agora e seja um verdadeiro herói do Haskellator Heroes!

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: Cabal 3.6, Gloss<br>

## Pré Requisitos
Instalação do Haskell

**Cuidado**: Em alguns pacotes padrão de distribuições, as versões do cabal estão desatualizadas. Uma alternativa é fazer o download da plataforma **GHCup** que disponibiliza gerenciamento de versão de programas do ambiente haskell. Para fazer o download, basta acessar a [página do GHCup](https://www.haskell.org/ghcup/), ou utilizar o seguinte script de instalação fornecido por eles:

``` bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
Usando APT do Ubuntu *(pode estar desatualizado)*:

```bash
sudo apt-get install haskell-platform
```

## Uso 
O software é bem intuitivo! Basta você iniciar buildar o projeto com o cabal e rodar utilizando os comandos abaixo, em seguida deve escolher um personagem dentro do escopo do jogo (os personagens estão em fotos no fundo da tela e com mais detalhes na wiki). Feito isso, basta responder as perguntas escolhando "sim" para as características que combinam com o personagem escolhido e "não" para as que não combinam. Ao final de uma série de perguntas, o jogo irá te dizer qual personagem você pensou. Simples e prático!

Cuidado. A utilize a flag --jobs em máquinas com mais de 1 core.

```bash
cabal build --jobs=2 --enable-optimization
cabal run
```

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | :-: |
| Adrian Soares Lopes | Frontend, estrutura da árvore e organização do repositório | Excelente |
| Bianca Sofia Brasil de Oliveira | Backend, estrutura da árvore e organização do repositório | Excelente |
| Daniel Vinicius Ribeiro Alves | Frontend e organização do repositório | Excelente |
| Daniela Soares de Oliveira | Backend, estrutura da árvore e organização repositório | Excelente |
| Eduardo Maia Rezende | Backend, organização do repositório e gitpages | Excelente |
| Erick Melo Vidal de Oliveira | Frontend e organização do repositório | Excelente |
| João Victor Max Bisinotti de Oliveira | Backend, Frontend e estrutura da árvore | Excelente |
| Klyssmann Henrique Ferreira de Oliveira | Backend, estrutura da árvore e organização do repositório | Excelente |
| Vitor Eduardo Kühl Rodrigues | Backend e estrutura da árvore | Excelente |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
Referencie, adequadamente, as referências utilizadas.
Indique ainda sobre fontes de leitura complementares.
