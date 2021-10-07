*** Settings ***
Resource  ../resource/Resource.robot
Test Setup  Abrir navegador
Test Teardown  Fechar navegador

## SETUP: roda keyword antes da suíte ou antes de um teste
## TEARDOWN: roda keyword depois de uma suíte ou um teste

*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então deve ser retornado mensagem "No results were found for your search "itemNãoExistente""
