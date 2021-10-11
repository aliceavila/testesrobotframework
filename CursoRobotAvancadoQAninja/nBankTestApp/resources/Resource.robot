*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variables ***
${BROWSER}   chrome
${URL}       https://nbank.vercel.app/

*** Keywords ***
#### Setup e Teardown
Abrir navegador
  Open Browser    ${URL}    ${BROWSER}

Fechar navegador
  Close Browser
