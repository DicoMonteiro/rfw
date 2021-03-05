***Settings***
Documentation       Testando o player de paródias

Resource            ../resources/base.robot

Test Teardown       Take Screenshot

***Test Cases***
Reproduzir paródia Bug de Manhã
        Open Login Page
        Login With  papito@parodify.com  pwd123
        Logout Link Should Be Visible

        Click       css=a[href*=search]
        # Faz a verificação de estar na página correta
        # Get Text    css=h2        equal       Buscar
        Wait For Elements State     xpath=//h2[contains(text(), "Buscar")]    visible     10

        # Clicar no elemento específico, no caso album Sertanejo
        Click       xpath=//img[contains(@src, "sertanejo.png")]/..
        # Clicar no elemento específico, no caso a dupla Marcus e Debug
        Click       xpath=//p[contains(text(), "Marcus e Debug")]/..
        # Faz a validação de que está na página correta para executar o player da música
        Get Text    css=h2        equal       Músicas
        # Clicar no elemento específico, no caso a música Bug de Manhã
            # Duas estratégias para pegar o elemento, bem detalhado e específico
        Click       xpath=//h2[contains(text(), "Bug de Manhã")]/../..//div[contains(@class, "play")]//a
        # Click       xpath=//h2[contains(text(), "Bug de Manhã")]/../..//a[contains(@data-song, "bugdemanha.mp3")]
       
        # Sleep       10
        # Validar o elemento pelo style css dele, pegando pela alteração de cor
        Get Style   xpath=//h2[contains(text(), "Bug de Manhã")]/../../..   color   equal   rgb(225, 0, 180)