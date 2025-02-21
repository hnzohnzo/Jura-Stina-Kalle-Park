*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}             Chrome
${URL}                file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${TICKETS_NAV}        xpath=//li[@id='tickets-nav']/a
${TICKET_CATEGORY}    id=ticket-category
${TICKET_QUANTITY}    id=ticket-quantity
${ADD_TO_CART}        xpath=//form[@id='ticket-form']//button[@type='submit']
${LOGIN_SECTION}      id=login-section
${EXPECTED_ALERT_TEXT}    You must be logged in to purchase tickets.

*** Test Cases ***
User Cannot Buy Tickets Without Login
  Open Browser    ${URL}    ${BROWSER}
  Set Selenium Speed    0.2
  Navigate To Tickets
  Attempt To Add Tickets Without Login
  Close Browser

*** Keywords ***
Navigate To Tickets
  Click Element    ${TICKETS_NAV}
  Wait Until Page Contains Element    ${TICKET_CATEGORY}

Attempt To Add Tickets Without Login
  Select From List By Value    ${TICKET_CATEGORY}    VIP
  Input Text    ${TICKET_QUANTITY}    2
  Click Button    ${ADD_TO_CART}
  Verify Alert Message

Verify Alert Message
  ${alert_text}=    Handle Alert    ACCEPT
  Should Be Equal    ${alert_text}    ${EXPECTED_ALERT_TEXT}
  Wait Until Page Contains Element    ${LOGIN_SECTION}