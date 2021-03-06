***Settings
Documentation       Login
Library             SeleniumLibrary
Suite Setup         Inicia Sessao
Suite Teardown      Encerra Sessao
Test Teardown       Depois do Teste

***Variables
${url}      http://localhost:3000

*** Keywords ***
### Ganchos
Inicia Sessao
    #Open Browser                    ${url}  chrome
    #Set Window Size                 1200                  800
    Set Selenium Implicit Wait      2

Encerra Sessao
    Close Browser

Depois do Teste
    Capture Page Screenshot

#Qualidade começa na especificação
#Gherkin > Descrever comportamentos com Dado, Quando e Então

*** Test Cases
Login com sucesso 
    Dado que eu acesso a página de Login
    Quando eu submeto minhas credenciais 
    ...     dig@ninjapixel.com  dig123
    Então devo ser autenticado

Senha Incorreta
    [tags]  temp
    Dado que eu acesso a página de Login
    Quando eu submeto minhas credenciais 
    ...     dig@ninjapixel.com  senhaErrada
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

***Keywords
Dado que eu acesso a página de Login
    #Log To Console  Esta é a automação do step dado
    Open browser    ${url}  chrome

Quando eu submeto minhas credenciais 
    [Arguments]     ${email}   ${pass}
    Input Text      identifier:email        ${email}
    Input Text      identifier:passId       ${pass}
    Click element   class:btn

Então devo ver uma mensagem de alerta "${mensagem}"
    Page should contain     ${mensagem}     loglevel=DEBUG

Então devo ser autenticado
    Wait until page contains    dig
    Close Browser
    #Input Text                      identifier:email

#Comentarios da aula
    #Não Gherkin
    #Acesso a pagina de Login
    #Submeto minhas credenciais "diogo@ninjapixel.com" e "pwd123"
    #Devo ser autenticado

    #Testes tradicionais levam abordagem step-by-step (BDT)
    #Dado que acesso a pagina d elogin
    #Quando eu preencho o campo usuario com "diogo@ninjapixel.com"
    #E preencho o campo senha com "pwd123"
    #E clico em entrar
    #Então devo ser autenticado