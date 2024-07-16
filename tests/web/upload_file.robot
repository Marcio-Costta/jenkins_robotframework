*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library    Collections
Resource    ../../steps/upload_file_steps.resource
Resource    ../../hooks/hooks.robot

*** Test Cases ***
Cenário 01: Realizar Upload de arquivo
    [Documentation]    Script para realizar upload de arquivo
    [Setup]    Iniciação do teste
    Given que estou na home do automation exercise
    And clico em Contact Us
    When preencho o formulário com as informações necessárias
    And faço upload do arquivo
    # Then a mensagem "Your details have been submitted successfully" deverá ser visualizada
    [Teardown]    finalização do teste