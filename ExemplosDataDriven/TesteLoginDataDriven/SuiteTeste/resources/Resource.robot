*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}              chrome
${URL}                  https://www.saucedemo.com/
${HOME_TOPMENU}         xpath=//*[@id="root"]//*[@class="login_logo"]
${HOME_TITLE}           Swag Labs


*** Keywords ***
Acessar página home do site
    Open Browser                     ${URL}             ${BROWSER}
    Wait Until Element Is Visible    ${HOME_TOPMENU}
    Title Should Be                  ${HOME_TITLE}

Fechar Navegador
    Close Browser
