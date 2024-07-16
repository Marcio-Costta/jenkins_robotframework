*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../../hooks/hooks.robot
Resource    ../../steps/login_orange_steps.resource
Documentation    Esta suite tem como finalidade realizar testes de login no site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
Cenário 01: Realizar Login com usuario e senha válidos
    [Documentation]    Teste para login positivo
    [Tags]             login
    [Setup]            Iniciação do teste
    Dado que estou na tela de login do site OrangeHRM 
    E preencho o username e senha
    Quando clico no botão login
    Então devo ser logado com sucesso
    [Teardown]         finalização do teste