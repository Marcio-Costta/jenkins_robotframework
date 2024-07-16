*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource    ../../commom/api/constants_api.robot
#Resource    ../../variables/variables.env

*** Keywords ***
Criar Seção
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json 
    Create Session    alias=MySession    url=${DESAFIO_URL}    headers=${headers}

Realizar Login
    [Arguments]    ${USERNAME}    ${PASSWORD}    ${STATUS_CODE}
    ${body}    Create Dictionary
    ...        username=${USERNAME}
    ...        password=${PASSWORD}
    Log        ${body}
    
    
        ${resposta}    POST On Session
    ...                alias=MySession
    ...                url=${ENDPOINT_LOGIN}
    ...                json=${body}
    ...                expected_status=${STATUS_CODE}
    Log    ${resposta.json()}
    Set Test Variable    ${resposta}
    Set Test Variable    ${STATUS_CODE}
    Set Test Variable    ${RETURN}    ${resposta.json()}
Validar Logs
    Log    ${resposta.url}
    Log    ${resposta.headers}
    Log    ${resposta.reason}
    
Confirmar mensagem de erro
    IF    ${STATUS_CODE} != 401
        Fatal Error
    END
    
    Dictionary Should Contain Item    ${RETURN}    error    Credenciais inválidas
   