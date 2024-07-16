*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../commom/costants.robot

*** Keywords ***

Iniciação do teste
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To           url=${BASE_URL_Automation}

finalização do teste
    Capture Page Screenshot
    Close Browser