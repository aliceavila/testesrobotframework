*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variables ***
${HOME}              xpath=//*[@id="app"]
${BTN_FAZERPIX}      xpath=//*[@id="nav"]//a[@class="button is-success"]
${SELECT_BANCO}      xpath=//*[@id="app"]//option[2]
${FIELD_CHAVEPIX}    xpath=//*[@id="chave-pix"]
${FIELD_VALOR}       xpath=//*[@id="valor"]
${VALOR}             100
${BTN_ENVIARPIX}     xpath=//*[@id="app"]//button[2]
${CHAVE}             chaveemail@hotmail.com
${CONFERENCIA}       xpath=//*[@id="app"]//*[@class="minus-circle"][contains(text(),'R$ -${VALOR}')]

*** Keywords ***
#### Ações
Acionar PIX
  Wait Until Element Is Visible      ${HOME}
  Click Element                      ${BTN_FAZERPIX}

Preencher Dados Para Transação PIX de R$100
  Wait Until Element Is Visible      ${SELECT_BANCO}
  Click Element                      ${SELECT_BANCO}
  Input Text                         ${FIELD_CHAVEPIX}    ${CHAVE}
  Input Text                         ${FIELD_VALOR}       ${VALOR}

Enviar Pix
  Click Element    ${BTN_ENVIARPIX}

#### Conferências
Conferir transação
  Page Should Contain Element    ${CONFERENCIA}
