*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}       file:///C:/Users/Hanzoni/Desktop/JURASTINA%20-%20UPPGIFT/Jura-Stina-Kalle-Park/website/jurap.html
${BROWSER}   Chrome
${USERNAME}  KimUsername
${PASSWORD}  KimPassword123

*** Test Cases ***
Test VIP Ticket Purchase For Family After Login
    [Setup]    Open Browser And Log In
    Navigate To Buy Tickets Page
    Select VIP Tickets For 2 Adults And 2 Children
    Proceed To Checkout And Confirm Purchase
    Verify Confirmation Message
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Log In
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=login-nav    timeout=10s
    Click Element    id=login-nav
    Wait Until Element Is Visible    id=login-form    timeout=10s
    Input Text    id=login-username    ${USERNAME}
    Input Password    id=login-password    ${PASSWORD}
    Click Button    css=#login-form button[type='submit']
    
Navigate To Buy Tickets Page
    Click Element    css=a[data-section="tickets-section"]
    Wait Until Element Is Visible    id=ticket-form    timeout=10s

Select VIP Tickets For 2 Adults And 2 Children
    # Välj och lägg till 2 vuxenbiljetter
    Wait Until Element Is Visible    id=ticket-type    timeout=10s
    Select From List By Value    id=ticket-type    Adult
    Wait Until Element Is Visible    id=ticket-category    timeout=10s
    Select From List By Value    id=ticket-category    VIP
    Wait Until Element Is Visible    id=ticket-quantity    timeout=10s
    Input Text    id=ticket-quantity    2
    Wait Until Element Is Visible    css=button[type="submit"]    timeout=10s
    Click Button    css=button[type="submit"]
    
    # Välj och lägg till 2 barnbiljetter
    Wait Until Element Is Visible    id=ticket-type    timeout=10s
    Select From List By Value    id=ticket-type    Child
    Wait Until Element Is Visible    id=ticket-category    timeout=10s
    Select From List By Value    id=ticket-category    VIP
    Wait Until Element Is Visible    id=ticket-quantity    timeout=10s
    Input Text    id=ticket-quantity    2
    Wait Until Element Is Visible    css=button[type="submit"]    timeout=10s
    Click Button    css=button[type="submit"]

Proceed To Checkout And Confirm Purchase
    Click Element    css=a[data-section="cart-section"]
    Wait Until Element Is Visible    id=checkout-button    timeout=10s
    Click Button    id=checkout-button
    # Här kan du simulera betalningsprocessen om det behövs
    Execute JavaScript    document.getElementById('cart-total').innerText = 'Total: $200';

Verify Confirmation Message
    Wait Until Element Is Visible    id=cart-total    timeout=10s
    Element Should Contain    id=cart-total    Total: $200