*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variables ***
${BROWSER}   chrome
${URL}       http://automationpractice.com

*** Keywords ***
#### Setup e Teardown
Abrir navegador
  Open Browser    about:blank   ${BROWSER}

Fechar navegador
  Close Browser
