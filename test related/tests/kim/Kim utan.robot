*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}             Chrome
${URL}                file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${EXPECTED_ALERT_TEXT}    You must be logged in to purchase tickets.

*** Test Cases ***
User Cannot Buy Tickets Without Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2
    Navigate To Tickets
    Attempt To Add Tickets Without Login
    Close Browser

*** Keywords ***
Navigate To Tickets
    Click Element    xpath=//li[@id='tickets-nav']/a
    Wait Until Page Contains Element    id=ticket-category

Attempt To Add Tickets Without Login
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Button    xpath=//form[@id='ticket-form']//button[@type='submit']
    Verify Alert Message

Verify Alert Message
    ${result}=    Run Keyword And Ignore Error    Get Alert Text
    Run Keyword And Ignore Error    Dismiss Alert
    Should Be Equal    ${result}[1]    ${EXPECTED_ALERT_TEXT}  # result[1] contains the alert text
    Wait Until Page Contains Element    id=login-section

Get Alert Text
    # Wait for the alert to appear and capture the alert text
    ${alert_text}=    Wait Until Keyword Succeeds    2s    3    Get Alert Text Safely
    [Return]    ${alert_text}

Get Alert Text Safely
    ${alert_text}=    Execute JavaScript    return window.alert;  # Get alert text using JavaScript
    Should Not Be Empty    ${alert_text}  # Ensure the alert text is not empty
    [Return]    ${alert_text}  # Return the alert text

Dismiss Alert
    Execute JavaScript    window.alert = function() {};  # Clear the alert