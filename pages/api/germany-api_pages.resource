*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Resource    ../../commom/api/constants_api.robot

*** Keywords ***
Criar Requisição
    [Arguments]    ${STATUS_CODE}
    ${response_consulta}    GET    url=${DESAFIO_URL}${GERMANY_ENDPOINT} 
    Set Test Variable    ${RESPONSE}    ${response_consulta.json()}  
    Log    ${RESPONSE}
    Set Test Variable    ${response_consulta}
    Set Test Variable    ${STATUS_CODE}
Validar Logs
    Log    ${response_consulta.url}
    Log    ${response_consulta.headers}
    Log    ${response_consulta.reason}
    Log    ${response_consulta.status_code}

Validar Status_Code 
    IF    ${STATUS_CODE} == 200
        Log    STATUS_CODE CORRETO
    
    ELSE
        Fatal Error
    END