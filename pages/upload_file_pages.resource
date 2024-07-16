*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library    Collections
Resource    ../commom/costants.robot

*** Keywords ***
Validar home do site 
    Title Should Be    Automation Exercise
    Wait Until Element Is Visible    locator=//img[@alt='Website for automation practice']

Cliar em Contact Us
    Click Element    locator=//a[contains(.,'Contact us')]
    Title Should Be    Automation Exercise - Contact Us
    Wait Until Element Is Visible    locator=//h2[contains(.,'Contact Us')]

Preencher formulario
    Input Text    locator=name        text=Seu Siriguejo
    Input Text    locator=email       text=seusirigueijo@teste.com
    Input Text    locator=subject     text= Receita de hamburguer de Siri 
    Input Text    locator=message     text=Anexo da Receita de hamburguer

Anexar arquivo
    Scroll Element Into View    locator=upload_file 
    Sleep    2 
    Click Element    locator=upload_file
    Click Element    locator=submit 

