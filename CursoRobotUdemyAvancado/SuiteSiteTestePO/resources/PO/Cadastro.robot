*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${AUTENTICACAO_TITLE}         Login - My Store
${AUTENTICACAO_FIELD_EMAIL}   xpath=//*[@id="email_create"]
${AUTENTICACAO_BTN_CREATE}    xpath=//*[@id="SubmitCreate"]
${CADASTRO_FORM_CREATION}     xpath=//*[@id="account-creation_form"]
${CADASTRO_FIELD_NAME}        xpath=//*[@id="customer_firstname"]
${CADASTRO_FIELD_LASTNAME}    xpath=//*[@id="customer_lastname"]
${CADASTRO_FIELD_PASSWORD}    xpath=//*[@id="passwd"]
${CADASTRO_FIELD_DIA}         xpath=//*[@id="days"]
${CADASTRO_SELECT_DIA}        xpath=//*[@id="days"]/option[7]
${CADASTRO_FIELD_MES}         xpath=//*[@id="months"]
${CADASTRO_SELECT_MES}        xpath=//*[@id="months"]/option[2]
${CADASTRO_FIELD_ANO}         xpath=//*[@id="years"]
${CADASTRO_SELECT_ANO}        xpath=//*[@id="years"]/option[24]
${CADASTRO_FIELD_ADDRESS}     xpath=//*[@id="address1"]
${CADASTRO_FIELD_CITY}        xpath=//*[@id="city"]
${CADASTRO_FIELD_STATE}       xpath=//*[@id="id_state"]
${CADASTRO_SELECT_STATE}      xpath=//*[@id="id_state"]/option[6]
${CADASTRO_FIELD_POSTAL}      xpath=//*[@id="postcode"]
${CADASTRO_FIELD_PHONE}       xpath=//*[@id="phone_mobile"]
${CADASTRO_BTN_REGISTER}      xpath=//*[@id="submitAccount"]
${ACCOUNT_TEXT}               xpath=//*[@id="center_column"]/p[@class="info-account"]

*** Keywords ***
#### Ações
Informar o e-mail válido "${EMAIL}"
  Title Should Be                    ${AUTENTICACAO_TITLE}
  Wait Until Element Is Visible      ${AUTENTICACAO_FIELD_EMAIL}
  Input Text                         ${AUTENTICACAO_FIELD_EMAIL}     ${EMAIL}

Clicar em Create an account
  Wait Until Element Is Visible      ${AUTENTICACAO_BTN_CREATE}
  Click Element                      ${AUTENTICACAO_BTN_CREATE}

Preencher os dados obrigatórios
  Wait Until Page Contains Element   ${CADASTRO_FORM_CREATION}
  Input Text                         ${CADASTRO_FIELD_NAME}          ALICE
  Input Text                         ${CADASTRO_FIELD_LASTNAME}      MONTEIRO
  Input Text                         ${CADASTRO_FIELD_PASSWORD}      123456
  Click Element                      ${CADASTRO_FIELD_DIA}
  Click Element                      ${CADASTRO_SELECT_DIA}
  Click Element                      ${CADASTRO_FIELD_MES}
  Click Element                      ${CADASTRO_SELECT_MES}
  Click Element                      ${CADASTRO_FIELD_ANO}
  Click Element                      ${CADASTRO_SELECT_ANO}
  Input Text                         ${CADASTRO_FIELD_ADDRESS}       RUA 123
  Input Text                         ${CADASTRO_FIELD_CITY}          RECIFE
  Click Element                      ${CADASTRO_FIELD_STATE}
  Click Element                      ${CADASTRO_SELECT_STATE}
  Input Text                         ${CADASTRO_FIELD_POSTAL}        66666
  Input Text                         ${CADASTRO_FIELD_PHONE}         81999999999


Submeter cadastro
  Click Element                      ${CADASTRO_BTN_REGISTER}

#### Conferências
Conferir se o cadastro foi efetuado com sucesso
  Wait Until Element Is Visible      ${ACCOUNT_TEXT}
  Element Text Should Be             ${ACCOUNT_TEXT}    Welcome to your account. Here you can manage all of your personal information and orders.
