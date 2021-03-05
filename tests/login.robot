***Settings***
Documentation       Testes da página login
# Usando a biblioteca Browser Library (Melhor desempenho que a SeleniumLibrary)
# Library             Browser

# Resource            resources/actions/login_resource.robot
# Resource            resources/actions/home_logada.robot

Resource            ../resources/base.robot

# Gancho para tirar screenshot apos a execucao de cada teste
Test Teardown       Take Screenshot


***Test Cases***
Login com sucesso
    [Tags]      smoke
    # O New Page executou com sucesso 
    # New Page        https://parodify.herokuapp.com/users/sign_in
    # Open Browser    https://parodify.herokuapp.com/users/sign_in    chromium
    # Verifica se exite um determinado elemento na pagina
    # Get Text        label[for=user_email]    contains    Email
    # Fill Text       id=user_email           papito@parodify.com
    # Fill Text       css=input[name*=email]           papito@parodify.com
    # Fill Text       css=#user_password      pwd123
    # Click           css=input[value="Log in"]
    # Sleep           10
    Open Login Page
    Login With                  papito@parodify.com     pwd123
    # Wait For Elements State     css=a[href$=sign_out]       visible     10
    Logout Link Should Be Visible

Senha incorreta
    # New Page        https://parodify.herokuapp.com/users/sign_in
    # Get Text        label[for=user_email]    contains    Email
    # Fill Text       id=user_email           papito@parodify.com
    # Fill Text       css=#user_password      teste123
    # Click           css=input[value="Log in"]
    Open Login Page
    Login With      papito@parodify.com     teste123
    Wait For Elements State     css=.is-danger       visible     10
    # Get Text        css=.is-danger .message-body    ==    Opps! Dados de acesso incorretos!
    Alert Should Be     Opps! Dados de acesso incorretos!

Email não existe
    # New Page        https://parodify.herokuapp.com/users/sign_in
    # Get Text        label[for=user_email]    contains    Email
    # Fill Text       id=user_email           404@parodify.com
    # Fill Text       css=#user_password      pwd123
    # Click           css=input[value="Log in"]
    Open Login Page
    Login With      404@parodify.com     pwd123
    Wait For Elements State     css=.is-danger       visible     10
    # Get Text        css=.is-danger .message-body    ==    Opps! Dados de acesso incorretos!
    Alert Should Be     Opps! Dados de acesso incorretos!

Email não informado
    # New Page        https://parodify.herokuapp.com/users/sign_in
    # Get Text        label[for=user_email]    contains    Email
    # Fill Text       id=user_email           ${EMPTY}
    # Fill Text       css=#user_password      pwd123
    # Click           css=input[value="Log in"]
    Open Login Page
    Login With      ${EMPTY}     pwd123
    Wait For Elements State     css=.is-danger       visible     10
    # Get Text        css=.is-danger .message-body    ==    Opps! Dados de acesso incorretos!
    Alert Should Be     Opps! Dados de acesso incorretos!

Senha não informada
    # New Page        https://parodify.herokuapp.com/users/sign_in
    # Get Text        label[for=user_email]    contains    Email
    # Fill Text       id=user_email           papito@parodify.com
    # Fill Text       css=#user_password      ${EMPTY}
    # Click           css=input[value="Log in"]
    Open Login Page
    Login With      papito@parodify.com     ${EMPTY}
    Wait For Elements State     css=.is-danger       visible     10
    # Get Text        css=.is-danger .message-body    ==    Opps! Dados de acesso incorretos!
    Alert Should Be     Opps! Dados de acesso incorretos!



# ***Keywords***
# Login With
#     [Arguments]         ${email_arg}            ${password_arg}
#     Fill Text       id=user_email               ${email_arg} 
#     Fill Text       css=#user_password          ${password_arg}
#     Click           css=input[value="Log in"]