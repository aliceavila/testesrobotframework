*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             String
Resource            ./variables/UserAndPassword.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/aliceavila/testesrobotframework/issues

*** Test Cases ***
Teste 01: Usando Authentication (Basic Auth)
    # Conectar com autenticação básica na API sem token
    Conectar com autenticação por token na API do GitHub
    Solicitar os dados do meu usuário

Teste 02: Usando Params
    Conectar na API do GitHub sem autenticação
    Pesquisar issues com o state "open" e com o label "bug"

Teste 03: Usando Headers
    # Conectar com autenticação básica na API sem token
    Conectar com autenticação por token na API do GitHub
    Enviar a reação "heart" para a issue "1"
	
Teste 04: Publicando com body template
    # Conectar com autenticação básica na API sem token
    Conectar com autenticação por token na API do GitHub
    Postar uma nova issue com label "robot framework"

*** Keywords ***
# Conectar com autenticação básica na API sem token
#     ${AUTH}             Create List           ${MY_GITHUB_USER}      ${MY_GITHUB_PASS}
#     Create Session      alias=mygithubAuth    url=${GITHUB_HOST}     auth=${AUTH}     disable_warnings=True

Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Solicitar os dados do meu usuário
    ${MY_USER_DATA}     Get Request          alias=mygithubAuth   uri=/user
    Log                 Meus dados: ${MY_USER_DATA.json()}
    Confere sucesso na requisição   ${MY_USER_DATA}

Conectar na API do GitHub sem autenticação
    Create Session      alias=mygithub        url=${GITHUB_HOST}     disable_warnings=True

Pesquisar issues com o state "${STATE}" e com o label "${LABEL}"
    &{PARAMS}           Create Dictionary    state=${STATE}       labels=${LABEL}
    ${MY_ISSUES}        Get Request          alias=mygithub       uri=${ISSUES_URI}    params=${PARAMS}
    Log                 Lista de Issues: ${MY_ISSUES.json()}
    Confere sucesso na requisição   ${MY_ISSUES}

Enviar a reação "${REACTION}" para a issue "${ISSUE_NUMBER}"
    ${HEADERS}          Create Dictionary    Accept=application/vnd.github.squirrel-girl-preview+json
    ${MY_REACTION}      Post Request    alias=mygithubAuth    uri=${ISSUES_URI}/${ISSUE_NUMBER}/reactions
    ...                                 data={"content": "${REACTION}"}     headers=${HEADERS}
    Log                 Meus dados: ${MY_REACTION.json()}
    Confere sucesso na requisição   ${MY_REACTION}
	
Postar uma nova issue com label "${LABEL}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_issue.json
    ...             user_git=${MY_GITHUB_USER}
    ...             label=${LABEL}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     Post Request    alias=mygithubAuth    uri=${ISSUES_URI}   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}
