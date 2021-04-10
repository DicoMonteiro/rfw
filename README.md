# Execução gerando o log em uma pasta especifica:

    robot -d ./logs <arquivo_robot>

    Ex: robot -d ./logs login.robot

# Execução passando a tag para executar um(ns) cenário(s) específico(s):

    robot -d ./logs -i <nome_da_tag> <arquivo_robot>

    Ex: robot -d ./logs -i smoke login.robot

# Execução dentro de uma pasta

    robot -d ./logs tests/login.robot

# Execução passando variáveis

    robot -d ./logs -v browser:chromium -v headless:false tests\player.robot