*** Settings ***
Library    SeleniumLibrary
Resource    ../commom/costants.robot
Resource    ../variables/variables.env

*** Variables ***
${TITLE_LOGIN_PAGE}    OrangeHRM
${ORANGE_LOGO}         xpath=//img[@alt='company-branding']
${USERNAME_FIELD}      name=username
${PASSWORD_FIELD}      name=password
${BTN_LOGIN}           xpath=//button[@type='submit']
${BANNER_LOGIN}        xpath=//img[contains(@alt,'client brand banner')]
${HEADER_DASHBOARD}    xpath=//h6[contains(.,'Dashboard')]

*** Keywords ***
Validar tela de login
    Title Should Be    title=${TITLE_LOGIN_PAGE}
    Wait Until Element Is Visible    locator=${ORANGE_LOGO}

Preencher usenamer e senha
    [Arguments]    ${USERNAME_LOGIN}    ${PASSWORD_LOGIN}
    Input Text    locator=${USERNAME_FIELD}    text=Admin
    Input Text    locator=${PASSWORD_FIELD}    text=admin123

Clicar no botão login
    Click Element    locator=${BTN_LOGIN}

Confirmar login
    Wait Until Element Is Visible    locator=${BANNER_LOGIN}
    Wait Until Element Is Visible    locator=${HEADER_DASHBOARD}
    Sleep    3
