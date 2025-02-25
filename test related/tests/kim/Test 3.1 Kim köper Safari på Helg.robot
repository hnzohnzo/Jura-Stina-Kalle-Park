*** Settings ***
Library    SeleniumLibrary 
Test Teardown    Close All Browsers

*** Variables ***
${URL}              file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}          Chrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${SAFARI_DATE}      002025-03-01  # Updated date format to match the application
${SAFARI_QUANTITY}  4

*** Test Cases ***

Complete Test
    [Documentation]  Tests the full booking process for a VIP safari on a dynamically chosen weekend date.

    Open Browser and URL
    Register New User
    Login with Existing User
    Navigate to 'Buy Tickets' and Add Two Adult VIP Tickets to Cart
    Add Two Children VIP Tickets to Cart
    Add Multiple Safaris to Cart    ${SAFARI_QUANTITY}
    Proceed to Checkout, Then Show Checkout Summary

*** Keywords ***

Open Browser and URL
    [Documentation]  Opens the browser and navigates to the Safari booking page.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

Register New User
    [Documentation]  Clicks on 'Register' and registers a new user with valid credentials.

    Wait Until Element is Visible    id=register-nav
    Click Element    id=register-nav
    Wait Until Element is Visible    id=register-section
    Input Text    id=reg-username    ${USERNAME}
    Input Text    id=reg-password    ${PASSWORD}
    Click Element    xpath=//form[@id='register-form']//button[@type='submit']
    Sleep    2s

Login with Existing User
    [Documentation]  Logs in with the registered user.

    Wait Until Element Is Visible    id=login-nav
    Click Element    id=login-nav
    Wait Until Element is Visible    id=login-section
    Input Text    id=login-username    ${USERNAME}
    Input Text    id=login-password    ${PASSWORD}
    Click Element    xpath=//form[@id='login-form']//button[@type='submit']
    Wait Until Element Is Visible    id=logout-nav
    Element Should Be Visible    id=cart-nav

Navigate to 'Buy Tickets' and Add Two Adult VIP Tickets to Cart
    [Documentation]  Adds 2 Adult VIP tickets to the cart.

    Wait Until Element Is Visible    id=tickets-nav
    Click Element    id=tickets-nav
    Wait Until Element Is Visible    id=tickets-section
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert

Add Two Children VIP Tickets to Cart
    [Documentation]  Adds 2 Children VIP tickets to the cart.

    Select From List By Value    id=ticket-type    Child
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert

Add Multiple Safaris to Cart
    [Documentation]  Adds multiple safaris to the cart using a loop.
    [Arguments]    ${quantity}

    Wait Until Element Is Visible    id=safari-nav
    Click Element    id=safari-nav
    Wait Until Element Is Visible    id=safari-section

    FOR    ${i}    IN RANGE    ${quantity}
        Input Text    id=safari-date    ${SAFARI_DATE}  # Enter the date for each iteration
        Select From List By Label    id=safari-type    ${SAFARI_TYPE}
        Click Element    xpath=//form[@id='safari-form']//button[@type='submit']
        Handle Alert    action=ACCEPT    timeout=5s  # Ensure the alert is handled properly
        Sleep    1s  # Add a small delay to allow the cart to update
    END

Proceed to Checkout, Then Show Checkout Summary
    [Documentation]  Proceeds to checkout and verifies the checkout summary.

    Wait Until Element Is Visible    id=cart-nav
    Click Element    id=cart-nav
    Wait Until Element Is Visible    id=cart-section
    Element Should Be Visible    id=cart-details
    Wait Until Element Is Enabled    id=checkout-button
    Click Element    id=checkout-button
    Sleep    2s
    ${checkout_summary}=    Handle Alert    timeout=10s
    Should Contain    ${checkout_summary}    2 VIP Adult Ticket(s) - $200
    Should Contain    ${checkout_summary}    2 VIP Child Ticket(s) - $120
    Should Contain    ${checkout_summary}    T-Rex Rumble eXtreme Thrill Pack on 2025-03-01 - $220
    Should Contain    ${checkout_summary}    T-Rex Rumble eXtreme Thrill Pack on 2025-03-01 - $220
    Should Contain    ${checkout_summary}    T-Rex Rumble eXtreme Thrill Pack on 2025-03-01 - $220
    Should Contain    ${checkout_summary}    T-Rex Rumble eXtreme Thrill Pack on 2025-03-01 - $220
    Should Contain    ${checkout_summary}    Total: $1200
    Sleep    3s