*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Resource    ../pages/upload_file_pages.resource

*** Keywords ***
Given que estou na home do automation exercise
    Validar home do site 

And clico em Contact Us
    Cliar em Contact Us

When preencho o formulário com as informações necessárias
    Preencher formulario

And faço upload do arquivo
    Anexar arquivo