*** Settings ***
Library    SeleniumLibrary 

*** Variables ***
${URL}              file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}          Chrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${SAFARI_DATE}      002025-03-01
${alert_text}  

*** Keywords ***

the browser is open on the correct URL
    [Documentation]  Opens the browser and navigates to the Safari booking page.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

the user registers a new account
    [Documentation]  Clicks on 'Register' and registers a new user with valid credentials.

    Wait Until Element is Visible    id=register-nav
    Click Element    id=register-nav
    Wait Until Element is Visible    id=register-section
    Input Text    id=reg-username    ${USERNAME}
    Input Text    id=reg-password    ${PASSWORD}
    Click Element    xpath=//form[@id='register-form']//button[@type='submit']
    Sleep    2s

the user logs in with the new account
    [Documentation]  Logs in with the registered user.

    Wait Until Element Is Visible    id=login-nav
    Click Element    id=login-nav
    Wait Until Element is Visible    id=login-section
    Input Text    id=login-username    ${USERNAME}
    Input Text    id=login-password    ${PASSWORD}
    Click Element    xpath=//form[@id='login-form']//button[@type='submit']
    Wait Until Element Is Visible    id=logout-nav
    Element Should Be Visible    id=cart-nav

the user Attempts to Book Safari Without General Admission Tickets
    [Documentation]  Attempts to book a VIP Safari ticket without having general admission tickets.

    Wait Until Element Is Visible    id=safari-nav
    Click Element    id=safari-nav
    Wait Until Element Is Visible    id=safari-section
    Input Text    id=safari-date    ${SAFARI_DATE} 
    Select From List By Label    id=safari-type    ${SAFARI_TYPE}
    Click Element    xpath=//form[@id='safari-form']//button[@type='submit']

Alert Message is Shown
    [Documentation]    Checks if the alert message is shown when trying to book Safari without general admission tickets.

    Run Keyword And Ignore Error    Handle Alert    ACCEPT
    Wait Until Page Contains Element    id=tickets-nav
    Click Element    id=tickets-nav