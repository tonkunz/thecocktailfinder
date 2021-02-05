"Este repositório refere-se a prova de mobile do [Processo Seletivo para Analista Desenvolvedor](https://drive.google.com/file/d/1CB7atHZJR9t1G0XLezWL1RMj0GqjkmPP/view), promovido pela Polícia Judiciária Civil de Mato Grosso, do candidato Everton Henrique Oliveira Kunz"

# The Cocktail Finder Mobile

The Cocktail Finder trata-se de uma aplicação mobile, construída com o framework multiplataforma da Google, o [Flutter](https://flutter.dev/), consumindo à API gratuíta [TheCocktailDB](https://www.thecocktaildb.com/api.php).


## Principais Tecnologias Utilizadas

 - [Flutter](https://flutter.dev/): Framework multiplataforma em Dart;
 - [Dio](https://pub.dev/packages/dio): Cliente Http em Dart, que suporta Interceptors, configurações Globais, etc;
 - [Provider](https://pub.dev/packages/provider): Famosas biblioteca para facilitar passagem e consumo de dados entre a hierarquia de Widgets.

## Estratégia de Controle de Estado

Como mencionado anteriormente, o Provider foi uma das bibliotecas mais usadas neste projeto e o motivo é que o pattern adotado para controle de estado aqui foi o BloC (Business Logic Component). O BLoC foi criado para separar regras de negócio e interface de usuário.

## Rodando o Projeto Localmente

 - Tratando-se de um projeto mobile, diversas etapas de configuração não podem ser ignoradas, como:
   - Escolha do editor (VsCode, AndroidStudio, etc);
   - Configuração de um emulador Android ou execução em um dispositivo real;
   - Instação do Flutter, Java, etc;

 - Dito isto, nada melhor como conferir a [documentação oficial](https://flutter.dev/docs/get-started/install) para configuração do ambiente e teste;
 - Embora o Flutter seja multiplaforma (Android ou IOS), o desenvolvimento deste projeto foi focado e testado na plataforma Android apenas.

## APK Demonstrativo

Versão upada do APK, caso deseje testar.
https://drive.google.com/file/d/1vGidRyPIplA5PUCl1C6986TMANA5064R/view?usp=sharing
