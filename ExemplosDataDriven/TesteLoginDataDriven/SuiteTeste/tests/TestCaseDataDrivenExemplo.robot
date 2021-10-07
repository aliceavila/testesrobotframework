*** Settings ***
Resource         ../resources/Resource.robot
Library          DataDriver     ../DataDriven/DataDrivenCSV.csv
Library          SeleniumLibrary
Library          String

Suite Setup      Acessar página home do site
Suite Teardown   Fechar Navegador
Test Template    Cenarios de login invalidos

*** Variables ***
${TXTBOX_USERNAME}      xpath=//*[@id="user-name"]
${TXTBOX_PASSWORD}      xpath=//*[@id="password"]
${BTN_LOGIN}            xpath=//*[@id="login-button"]
${TXT_ERROR}            xpath=//*[@id="login_button_container"]//*[@class="error-message-container error"]

*** Test Case ***
Verificar falhas de login com credenciais invalidos  ${USERNAME}  ${PASSWORD}  ${ERROR_MSG}

*** Keyword ***
Cenarios de login invalidos
    [Arguments]   ${USERNAME}  ${PASSWORD}  ${ERROR_MSG}
    Input Text    ${TXTBOX_USERNAME}    ${USERNAME}
    Input Text    ${TXTBOX_PASSWORD}    ${PASSWORD}
    Click Button  ${BTN_LOGIN}
    Sleep  2s
    Element Should Contain  ${TXT_ERROR}    ${ERROR_MSG}
