*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}             Chrome
${URL}                file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${LOGIN_NAV}          xpath=//li[@id='login-nav']/a
${LOGIN_USERNAME}     id=login-username
${LOGIN_PASSWORD}     id=login-password
${LOGIN_BUTTON}       xpath=//form[@id='login-form']//button[@type='submit']
${TICKETS_NAV}        xpath=//li[@id='tickets-nav']/a
${TICKET_CATEGORY}    id=ticket-category
${TICKET_TYPE}        id=ticket-type
${TICKET_QUANTITY}    id=ticket-quantity
${ADD_TO_CART}        xpath=//form[@id='ticket-form']//button[@type='submit']
${CART_SECTION}       id=cart-section
${CHECKOUT_BUTTON}    id=checkout-button
${PURCHASE_SUMMARY}   xpath=//div[@id='cart-details']

*** Test Cases ***
Kim Selects VIP Tickets For The Whole Family
  Open Browser    ${URL}    ${BROWSER}
  Maximize Browser Window
  Set Selenium Speed    0.2
  Login As Kim
  Navigate To Buy Tickets
  Select VIP Tickets For 2 Adults
  Select VIP Tickets For 2 Children
  Proceed To Checkout
  Confirm Purchase
  Verify Purchase Summary
  Close Browser

*** Keywords ***
Login As Kim
  Click Element    ${LOGIN_NAV}
  Wait Until Page Contains Element    ${LOGIN_USERNAME}
  Input Text    ${LOGIN_USERNAME}    KimUsername
  Input Text    ${LOGIN_PASSWORD}    KimPassword123
  Click Button    ${LOGIN_BUTTON}
  Wait Until Page Does Not Contain Element    ${LOGIN_SECTION}

Navigate To Buy Tickets
  Click Element    ${TICKETS_NAV}
  Wait Until Page Contains Element    ${TICKET_CATEGORY}

Select VIP Tickets For 2 Adults
  Select From List By Value    ${TICKET_TYPE}    Adult
  Select From List By Value    ${TICKET_CATEGORY}    VIP
  Input Text    ${TICKET_QUANTITY}    2
  Click Button    ${ADD_TO_CART}
  Wait Until Page Contains Element    ${CART_SECTION}

Select VIP Tickets For 2 Children
  Select From List By Value    ${TICKET_TYPE}    Child
  Select From List By Value    ${TICKET_CATEGORY}    VIP
  Input Text    ${TICKET_QUANTITY}    2
  Click Button    ${ADD_TO_CART}
  Wait Until Page Contains Element    ${CART_SECTION}

Proceed To Checkout
  Click Button    ${CHECKOUT_BUTTON}
  Wait Until Page Contains    Confirm Purchase

Confirm Purchase
  # Assuming there is a confirmation button or action after checkout
  # Replace the following line with the actual confirmation step
  Click Button    id=confirm-purchase-button
  Wait Until Page Contains    Purchase Successful

Verify Purchase Summary
  Wait Until Page Contains Element    ${PURCHASE_SUMMARY}
  Page Should Contain    VIP Ticket (Adult) x 2
  Page Should Contain    VIP Ticket (Child) x 2
  Page Should Contain    Total: