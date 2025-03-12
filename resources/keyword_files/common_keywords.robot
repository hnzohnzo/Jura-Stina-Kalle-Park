*** Settings ***
Library    SeleniumLibrary
Resource    /Users/mac/Jura-Stina-Kalle-Park/resources/common_variables.robot

*** Keywords ***
# Ortak Keywords - common.robot'dan
Open Browser To Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Browser
    Close Browser

# Kim Keywords - kim.robot'dan
Navigate To Registration Page
    Click Element    id=register-nav
    Wait Until Element Is Visible    id=register-section    timeout=${TIMEOUT}
    Sleep    2s

Fill Registration Form
    [Arguments]    ${username}    ${password}
    Input Text    id=reg-username    ${username}
    Input Text    id=reg-password    ${password}
    Click Button    xpath=//button[@type='submit']

Navigate To Login Page
    Click Element    id=login-nav
    Wait Until Element Is Visible    id=login-section    timeout=10s
    Sleep    2s

Fill Login Form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id=login-username    timeout=10s
    Input Text    id=login-username    ${username}
    Input Text    id=login-password    ${password}
    Click Button    xpath=//form[@id='login-form']//button[@type='submit']
    Sleep    2s