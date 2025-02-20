*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${BROWSER}    chrome
${URL}    file:///Users/mac/Desktop/jurastina-alfa/jurap.html    
${TIMEOUT}    10s

*** Keywords ***
Open Browser To Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Browser    
    Close Browser    