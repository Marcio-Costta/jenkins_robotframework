*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/login_orange_pages.resource

*** Keywords ***
Dado que estou na tela de login do site OrangeHRM 
    Validar tela de login

E preencho o username e senha
    Preencher usenamer e senha    $USERNAME_LOGIN    $PASSWORD_LOGIN

Quando clico no botão login
    Clicar no botão login

Então devo ser logado com sucesso
    Confirmar login