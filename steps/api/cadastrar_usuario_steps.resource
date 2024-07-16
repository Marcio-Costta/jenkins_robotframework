*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem
Resource    ../../pages/api/cadastrar_usuario_pages.resource

*** Keywords ***
Given que estou no swegger serverest
    Criar Seção No Endpoint
    Gerar dados do usuario

And no cadastro um usuario com um email valido
    Cadastrar usuario    $email    status_code=201

Then o cadastro deve ser realizado com sucesso
    Validar cadastro do usuario

#CT002 -
Given que estou no swegger no endpoint de id_usuario
    Realizar Requisição no endpoint usuarios

And após uma requisição são retornados os dados cadastrados
    Confirmar Logs
Then os dados devem ser retornados corretamente
    Validar conteudo do json