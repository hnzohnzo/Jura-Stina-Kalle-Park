*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}       file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle-Park/Jura-Stina-Kalle-Park/website/jurap.html
${BROWSER}   Chrome
${USERNAME}  KimUsername
${PASSWORD}  KimPassword123
${INVALID_USERNAME}    InvalidUser
${INVALID_PASSWORD}    InvalidPass

*** Test Cases ***
Verify Login Form Elements Exist
    [Setup]    Open Browser To Login Page
    Verify Login Form Elements Are Visible
    [Teardown]    Close Browser

Test Valid Login Form Input
    [Setup]    Open Browser To Login Page
    Input Valid Credentials
    Verify Input Fields Contain Expected Values
    [Teardown]    Close Browser

Test Empty Login Form Submission
    [Setup]    Open Browser To Login Page
    Submit Empty Login Form
    Verify Required Field Validation
    [Teardown]    Close Browser

Test Invalid Login Credentials
    [Setup]    Open Browser To Login Page
    Input Invalid Credentials
    Verify Error Message
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=login-nav    timeout=10s
    Click Element    id=login-nav
    Wait Until Element Is Visible    id=login-form    timeout=10s

Verify Login Form Elements Are Visible
    Element Should Be Visible    id=login-username
    Element Should Be Visible    id=login-password
    Element Should Be Visible    css=#login-form button[type='submit']
    Element Should Be Visible    id=login-message

Input Valid Credentials
    Input Text    id=login-username    ${USERNAME}
    Input Password    id=login-password    ${PASSWORD}
    Click Button    css=#login-form button[type='submit']

Verify Input Fields Contain Expected Values
    ${entered_username}=    Get Value    id=login-username
    Should Be Equal    ${entered_username}    ${USERNAME}
    ${entered_password}=    Get Value    id=login-password
    Should Be Equal    ${entered_password}    ${PASSWORD}

Submit Empty Login Form
    Click Button    css=#login-form button[type='submit']

Verify Required Field Validation
    ${username_field}=    Get Element Attribute    id=login-username    required
    Should Be Equal    ${username_field}    true
    ${password_field}=    Get Element Attribute    id=login-password    required
    Should Be Equal    ${password_field}    true

Input Invalid Credentials
    Input Text    id=login-username    ${INVALID_USERNAME}
    Input Password    id=login-password    ${INVALID_PASSWORD}
    Click Button    css=#login-form button[type='submit']

Verify Error Message
    Wait Until Element Contains    id=login-message    Username or password is incorrect    timeout=10s