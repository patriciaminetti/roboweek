*** Settings ***
Documentation    Cadastro de Jogos

Library    SeleniumLibrary


*** Test Cases ***
Cadastrar novo jogo
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    Então vejo a mensagem de sucesso "Produto cadastrado com sucesso"
    E vejo esse novo jogo na lista


*** Keywords ***
Dado que acesso o portal de cadastro de jogos
    Open Browser                  http://localhost:3000/    chrome
    Set Selenium Implicit Wait    5
    Click Link                    /produtos/new

Quando eu faço o cadastro de um novo jogo
    Input Text    id:produto_nome          Call of Duty
    Input Text    id:produto_descricao     Um jogo muito legal!    
    Input Text    id:produto_preco         99.99
    Input Text    id:produto_quantidade    10

    Click Element    xpath://input[@value='Criar Produto']    

Então vejo a mensagem de sucesso "${mensagem_esperada}"
    Element Should Contain    css:div[role=alert]    ${mensagem_esperada}

E vejo esse novo jogo na lista
    Element Should Contain    css:table tbody    Call of Duty

    Capture Page Screenshot
    Close Browser 