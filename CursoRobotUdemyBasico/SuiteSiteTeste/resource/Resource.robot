*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${BROWSER}  chrome
${URL}      http://automationpractice.com

*** Keywords ***

### Setup e Teardown
Abrir navegador
  Open Browser  about:blank  ${BROWSER}

Fechar navegador
  Close Browser

### Passo-a-passo Ações
Acessar a página home do site
  Go To               ${URL}
  Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Input Text    name=search_query    ${PRODUTO}

Clicar no botão pesquisar
  Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
   Wait Until Element Is Visible      css=#center_column > h1
   Title Should Be                    Search - My Store
   Page Should Contain Image          xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
   Page Should Contain Link           xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem "${MENSAGEM_ALERTA}"
   Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
   Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

####BDD
#####Cenário 01
Dado que estou na página home do site
  Go To               ${URL}
  Title Should Be     My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
  Input Text       name=search_query    ${PRODUTO}
  Click Element    name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
  Wait Until Element Is Visible      css=#center_column > h1
  Title Should Be                    Search - My Store
  Page Should Contain Image          xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
  Page Should Contain Link           xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

#####Cenário 02
Então deve ser retornado mensagem "${MENSAGEM_ALERTA}"
  Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
  Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}
