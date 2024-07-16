*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem   
Resource    ../../steps/api/germany-api_steps.resource

*** Test Cases ***
Cenário 01: Validar endpoint germany-api
    Given Given que estou no swagger
    And faço uma requisição para o endpoint germany-api
    Then deverá retornar o json com status_code 200