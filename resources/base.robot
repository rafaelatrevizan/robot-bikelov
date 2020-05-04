*** Settings ***
Library     SeleniumLibrary
Resource    elements.robot

*** Variables ***
${BASE_URL}     https://bikelov-anunciante.herokuapp.com/

*** Keywords ***
Start Session
    Open Browser                    about:blank      headlesschrome
    Set Selenium Implicit Wait      5
    #setar valor mínimo de tela para abrir o navegador
    Set Window Size                 1440    900

Logged with "${email}"
    Start Session
    Go To      ${BASE_URL}

    Input Text          ${INPUT_EMAIL}        ${email}
    Click Element       ${BUTTON_LOGIN}

    Page Should Contain Element     ${DIV_DASH}

End Session
    Close Browser

End Test
    Capture Page Screenshot