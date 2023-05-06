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

![Screenshot3](/img/screenshot3.png)
![Screenshot2](/img/screenshot2.png)
![Screenshot4](/img/screenshot4.png)
![Screenshot1](/img/screenshot1.jpeg)

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

[![Assistir Video](./img/backgorund1.png)](https://unbbr.sharepoint.com/:v:/s/Minha-Prpria/EcCkYkWsS8hHriHU7FNuY10B5l01xcxWZY6-yHzbI1Ezww?e=NOIeY5)
>Clique na imagem para assistir

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
### Lições Aprendidas:

Haskell é uma linguagem de programação funcional que requer um pensamento diferente e pode ser difícil de aprender, mas pode trazer benefícios na resolução de problemas complexos.
Haskell oferece flexibilidade ao trabalhar com Monads e funções recursivas e é adequado para a construção de árvores e para o desenvolvimento de back-end.
Trabalhar com um paradigma diferente do que se está acostumado pode ser desafiador, mas pode ser útil em algumas situações.
A reunião de escolha dos heróis facilitou o desenvolvimento do diagrama e da estrutura da árvore.

### Percepções:

A linguagem Haskell é elegante e oferece uma notação quase matemática para a aplicação de operações com iteradores.
A construção de árvores em Haskell é fácil em comparação com outras linguagens.
Haskell é mais adequado para o desenvolvimento de back-end e possui poucas bibliotecas para construção de interfaces.
A documentação da linguagem pode ser fraca.

### Contribuições e Fragilidades:

A equipe colaborou na elaboração das estruturas das funções e listas usadas no back-end e para a população das informações reais dos heróis.
A falta de consulta de material sobre a linguagem pode atrasar o desenvolvimento.
A passagem de parâmetros para as funções sem um separador pode ser um ponto fraco da linguagem.

### Trabalhos Futuros:

Explorar o uso de fmap e correlatos para fazer operações complexas em uma única linha de código.
Investigar formas de melhorar a documentação da linguagem.
Desenvolver mais bibliotecas para construção de interfaces.
Aplicar a linguagem em outras funcionalidades, principalmente no escopo universitário.

## Fontes

[Haskell Documentation](https://www.haskell.org/documentation/)<br>
[Gloss Documentation](https://hackage.haskell.org/package/gloss)<br>
[Wiki Liga da Justiça](https://ligadajustia.fandom.com/pt-br/wiki/Liga_da_Justi%C3%A7a)<br>
[DC Characteres](https://www.dc.com/characters)<br>
[Marvel Fandom](https://marvel.fandom.com/wiki/Marvel_Database)<br>