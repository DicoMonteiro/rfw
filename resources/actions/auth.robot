***Settings***
Documentation       Ações da funcionalidade de autorização/autenticação


***Variables***
${LOGOUT_LINK}              css=a[href$=sign_out]


***Keywords***
Open Login Page
    # Keyword para definir o browser e se ele vai executar em headless ou não
    New Browser     ${browser}    ${headless}
    New Page        https://parodify.herokuapp.com/users/sign_in
    # Open Browser    https://parodify.herokuapp.com/users/sign_in    chromium
    Get Text        label[for=user_email]    contains    Email

Login With
    [Arguments]         ${email_arg}            ${password_arg}
    # Fill Text       id=user_email               ${email_arg} 
    Fill Text       css=input[name*=email]      ${email_arg}
    Fill Text       css=#user_password          ${password_arg}
    Click           css=input[value="Log in"]

Alert Should Be
    [Arguments]         ${expect_arg}
    Get Text        css=.is-danger .message-body    ==    ${expect_arg}


Logout Link Should Be Visible
    Wait For Elements State     ${LOGOUT_LINK}       visible     10

Do Logout
    Click          ${LOGOUT_LINK}