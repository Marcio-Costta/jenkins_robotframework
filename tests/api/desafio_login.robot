*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource    ../../steps/api/desafio_login_steps.resource

*** Test Cases ***
Cenario 01: Realizar Login desafio 
    Given que realizo uma requisição POST
    And passo os parametros username e password
    Then o login deve ser realizado com sucesso e gerar um token

Cenario 02: Realizar login passando parametro invalido
    Given que realizo uma requisição POST
    And passo um ou mais parametros invalidos
    Then o stauts code devara ser 401 e retornar mensagem de erro
