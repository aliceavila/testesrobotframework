*** Settings ***
Resource          ../resources/Resource.robot
Resource          ../resources/PO/movimentacoesPix.robot

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***
Caso de Teste 01: Fazer Pix de R$100
  Acionar PIX
  Preencher Dados Para Transação PIX de R$100
  Enviar Pix
  Conferir transação
