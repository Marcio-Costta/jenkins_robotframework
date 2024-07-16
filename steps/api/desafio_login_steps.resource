*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource    ../../pages/api/desafio_login_pages.resource
#Resource    ../../variables/variables.env

*** Keywords ***
Given que realizo uma requisição POST
    Criar Seção
And passo os parametros username e password
    Realizar Login    admin    password    201 

Then o login deve ser realizado com sucesso e gerar um token
    Validar Logs

And passo um ou mais parametros invalidos
    Realizar Login    admin    pass    401

Then o stauts code devara ser 401 e retornar mensagem de erro
    Validar Logs
    Confirmar mensagem de erro