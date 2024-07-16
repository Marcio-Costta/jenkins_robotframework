*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Resource   ../../steps/api/cadastrar_usuario_steps.resource

*** Test Cases ***
CT001 - Cadastrar um usuário com sucesso
    Given que estou no swegger serverest
    And no cadastro um usuario com um email valido
    Then o cadastro deve ser realizado com sucesso

CT002 - Buscar usuario cadastrado por id 
    Given que estou no swegger no endpoint de id_usuario
    And após uma requisição são retornados os dados cadastrados
    Then os dados devem ser retornados corretamente