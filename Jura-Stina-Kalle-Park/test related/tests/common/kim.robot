*** Settings ***
Resource    common.robot

*** Variables ***
${KIM_USERNAME}    KimAndFamily
${KIM_PASSWORD}    KimAndFamily123
${SHORT_PASSWORD}    Kim
${WRONG_PASSWORD}    Wrongpassword123

*** Keywords ***
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
    Wait Until Element Is Visible    xpath=//input[@id='login-username']    timeout=10s
    Input Text    id=login-username    ${username}
    Input Text    id=login-password    ${password}
    Click Button    xpath=//button[@type='submit']