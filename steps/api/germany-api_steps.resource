*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Resource    ../../pages/api/germany-api_pages.resource

*** Keywords ***
Given que estou no swagger
    Criar Requisição    200

And faço uma requisição para o endpoint germany-api
    Validar Logs

Then deverá retornar o json com status_code 200
    Validar Status_Code  
