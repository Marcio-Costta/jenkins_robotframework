*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem
Library    String
Resource    ../../commom/api/constants_api.robot

*** Keywords ***
Criar Seção No Endpoint 
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json  
    Create Session    alias=ServeRest    url=${BASE_URL}    headers=${headers}

Gerar dados do usuario
    ${palavra_aleatória}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatória}    Convert To Lower Case    ${palavra_aleatória}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatória}@hotmail.com
    Log    ${EMAIL_TESTE}

Cadastrar usuario
    [Arguments]    ${email}    ${status_code}
	${body}    Create Dictionary    
    ...        nome=Bob Esponja    
    ...        email=${EMAIL_TESTE}    
    ...        password=esponja123    
    ...        administrador=true
    Log    ${body}

    ${resposta}    POST On Session
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${body}
    ...            expected_status=${status_code}
    Log    ${resposta.json()}
    IF    ${resposta.status_code} == 201
          Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}
    END
    
    Set Test Variable    ${RESPOSTA}   ${resposta.json()}
Validar cadastro do usuario
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

Realizar Requisição no endpoint usuarios
    ${resposta_consulta}    GET   url=${BASE_URL}/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESPONSE}    ${resposta_consulta.json()}
    Log    ${RESPONSE}
    Set Test Variable    ${resposta_consulta}
Confirmar Logs
    Log     ${resposta_consulta.status_code}
    Log     ${resposta_consulta.reason}
    Log     ${resposta_consulta.headers}
    Log     ${resposta_consulta.url}

Validar conteudo do json
    Dictionary Should Contain Item    ${RESPONSE}    _id             ${ID_USUARIO}
    Dictionary Should Contain Item    ${RESPONSE}    password        esponja123
    Dictionary Should Contain Item    ${RESPONSE}    email           fkza@hotmail.com
    Dictionary Should Contain Item    ${RESPONSE}    nome            Bob Esponja
    Dictionary Should Contain Item    ${RESPONSE}    administrador     true

    
    
