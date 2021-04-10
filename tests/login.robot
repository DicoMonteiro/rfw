***Settings***
Documentation       Testes da página login

Resource            ../resources/base.robot

# Gancho para tirar screenshot apos a execucao de cada teste
Test Teardown       Take Screenshot


***Test Cases***
Login com sucesso
    [Tags]      smoke
    
    Open Login Page
    Login With                  papito@parodify.com     pwd123

    Logout Link Should Be Visible

Senha incorreta
    Open Login Page
    Login With      papito@parodify.com     teste123
    Wait For Elements State     css=.is-danger       visible     10
    Alert Should Be     Opps! Dados de acesso incorretos!

Email não existe
    Open Login Page
    Login With      404@parodify.com     pwd123
    Wait For Elements State     css=.is-danger       visible     10
    Alert Should Be     Opps! Dados de acesso incorretos!

Email não informado
    Open Login Page
    Login With      ${EMPTY}     pwd123
    Wait For Elements State     css=.is-danger       visible     10
    Alert Should Be     Opps! Dados de acesso incorretos!

Senha não informada
    Open Login Page
    Login With      papito@parodify.com     ${EMPTY}
    Wait For Elements State     css=.is-danger       visible     10
    Alert Should Be     Opps! Dados de acesso incorretos!
