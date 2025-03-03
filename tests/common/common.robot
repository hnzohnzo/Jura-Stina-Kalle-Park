*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${BROWSER}    chrome
${URL}              file://${CURDIR}/../../../website/jurap.html    
${TIMEOUT}    10s

*** Keywords ***
Open Browser To Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Browser    
    Close Browser    