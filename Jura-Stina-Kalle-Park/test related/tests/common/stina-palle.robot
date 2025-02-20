*** Settings ***
Resource    common.robot

*** Variables ***
${STINA_USERNAME}    StinaPalle5
${STINA_PASSWORD}    Paleontologen
${SHORT_PASSWORD}    Palle
${WRONG_PASSWORD}    PaleontologWrong
#${loginbutton}    xpath=//button[@type='submit']
*** Keywords ***
Navigate To Registration Page
    Click Element    id=register-nav 
    Wait Until Element Is Visible    id=register-section    timeout=10s
    Sleep    2s
Fill Registration Form
    [Arguments]    ${username}    ${password}
    Input Text    id=reg-username    ${username}
    Input Text    id=reg-password    ${password}
    Click Button    xpath=//button[@type='submit']

Navigate To Login Page
    Click Element    id=login-nav
    Wait Until Element Is Visible    id=login-section
    Sleep    2s
Fill Login Form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id=login-username    timeout=10s
    Input Text    id=login-username    ${username}
    Input Text    id=login-password    ${password}
    Click Button   xpath=//form[@id='login-form']//button[@type='submit']