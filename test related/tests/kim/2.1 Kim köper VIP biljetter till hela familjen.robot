*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${URL}       file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}   chrome
${USERNAME}  KimUsername
${PASSWORD}  KimPassword123

*** Test Cases ***
Complete User Journey Test

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    
    # Registrering
    Wait Until Element Is Visible    id=register-nav
    Click Element    id=register-nav
    
    # Wait for registration form to be visible
    Wait Until Element Is Visible    id=register-section
    
    # Input registration credentials
    Input Text    id=reg-username    ${USERNAME}
    Input Text    id=reg-password    ${PASSWORD}
    
    # Submit registration form
    Click Element    xpath=//form[@id='register-form']//button[@type='submit']
    
    # Wait briefly for registration to process
    Sleep    2s
    
    # Login Steps
    Wait Until Element Is Visible    id=login-nav
    Click Element    id=login-nav
    
    # Wait for login form to be visible
    Wait Until Element Is Visible    id=login-section
    
    # Input login credentials
    Input Text    id=login-username    ${USERNAME}
    Input Text    id=login-password    ${PASSWORD}
    
    # Submit login form
    Click Element    xpath=//form[@id='login-form']//button[@type='submit']
    
    # Verify successful login by checking if logout link is visible
    Wait Until Element Is Visible    id=logout-nav
    Element Should Be Visible    id=logout-nav
    Element Should Be Visible    id=cart-nav
    
    # Navigate to Buy Tickets
    Wait Until Element Is Visible    id=tickets-nav
    Click Element    id=tickets-nav
    Wait Until Element Is Visible    id=tickets-section
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert    # Handle the "Item added to cart" alert
    Select From List By Value    id=ticket-type    Child
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert    # Handle the "Item added to cart" alert
    Wait Until Element Is Visible    id=cart-nav
    Click Element    id=cart-nav
    Wait Until Element Is Visible    id=cart-section
    Element Should Be Visible    id=cart-details
    Wait Until Element Is Enabled    id=checkout-button
    Click Element    id=checkout-button
    ${checkout_summary}=    Handle Alert    # Capture the alert text
    Should Contain    ${checkout_summary}    2 VIP Adult Ticket(s) - $200
    Should Contain    ${checkout_summary}    2 VIP Child Ticket(s) - $120
    Should Contain    ${checkout_summary}    Total: $320
    
    Sleep  3s

*** Keywords ***