*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       file:///C:/Users/Hanzoni/Desktop/JURASTINA%20-%20UPPGIFT/Jura-Stina-Kalle-Park/Jura-Stina-Kalle-Park/website/jurap.html
${BROWSER}   Chrome

*** Test Cases ***
Test VIP Ticket Purchase For Family
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
    # Hoppa över inloggning eller simulera att användaren redan är inloggad

Navigate To Buy Tickets Page
    Click Element    id=buy-tickets-link
    Wait Until Element Is Visible    id=ticket-selection-form    timeout=10s

Select VIP Tickets For 2 Adults And 2 Children
    Select From List By Value    id=adult-ticket-dropdown    2
    Select From List By Value    id=child-ticket-dropdown    2
    Click Button    id=add-to-cart-button

Proceed To Checkout And Confirm Purchase
    Click Element    id=checkout-button
    Wait Until Element Is Visible    id=payment-form    timeout=10s
    Input Text    id=card-number    4111111111111111
    Input Text    id=expiry-date    12/25
    Input Text    id=cvv    123
    Click Button    id=confirm-purchase-button

Verify Confirmation Message
    Wait Until Element Is Visible    id=confirmation-message    timeout=10s
    Element Should Contain    id=confirmation-message    2 VIP Tickets for Adults
    Element Should Contain    id=confirmation-message    2 VIP Tickets for Children
    Element Should Contain    id=confirmation-message    Total Price: $XXX