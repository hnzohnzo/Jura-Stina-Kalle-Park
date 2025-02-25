*** Settings ***
Library  SeleniumLibrary 
Test Teardown  Close All Browsers

*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome
${USERNAME}                               KimUsername
${PASSWORD}                               KimPassword123

*** Test Cases ***

Complete Test
  [Documentation]                         Hela Test Processen Från Registrering Till Köp av VIP-Biljetter

  Open Browser and URL
  Register New User
  Login with New User
  Navigate to 'Buy Tickets' and Add Two Adult VIP Tickets to Cart
  Add Two Children VIP Tickets to Cart  
  Proceed to Checkout, Then Show Checkout Summary

*** Keywords ***

Open Browser and URL
  [Documentation]                         Öppnar Browser och Rätt URL, Speed sat till 0.2s för att enklare hänga med visuellt.

  Open Browser  ${URL}  ${BROWSER} 
  Maximize Browser Window
  Set Selenium Speed                      0.2s



Register New User
  [Documentation]                         Klickar på 'Register' och registrerar en användare med korrekta uppgifter

  Wait Until Element is Visible           id=register-nav
  Click Element                           id=register-nav
  Wait Until Element is Visible           id=register-section
  Input Text                              id=reg-username  ${USERNAME} 
  Input Text                              id=reg-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='register-form']//button[@type='submit'] 
  Sleep                                   2s


Login with New User
  [Documentation]                         Klickar på 'Login' och loggar in med nyligen registrerad användare.

  Wait Until Element Is Visible           id=login-nav
  Click Element                           id=login-nav
  Wait Until Element Is Visible           id=login-section
  Input Text                              id=login-username  ${USERNAME}
  Input Text                              id=login-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='login-form']//button[@type='submit']
  Wait Until Element Is Visible           id=logout-nav
  Element Should Be Visible               id=cart-nav
  Element Should be Visible               id=cart-nav


Navigate to 'Buy Tickets' and Add Two Adult VIP Tickets to Cart
  [Documentation]                         Klickar på 'Buy Tickets' och lägger till 2st Adult VIP Tickets till varukorgen.

  Wait Until Element Is Visible           id=tickets-nav
  Click Element                           id=tickets-nav
  Wait Until Element Is Visible           id=tickets-section
  Select From List By Value               id=ticket-type    Adult
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert


Add Two Children VIP Tickets to Cart
  [Documentation]                         Klickar på 'Buy Tickets' och lägger till 2st Children VIP Tickets till varukorgen.

  Select From List By Value               id=ticket-type    Child
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert


Proceed to Checkout, Then Show Checkout Summary
  [Documentation]                         Klickar på 'Cart' och sedan på 'Proceeed to Checkout'

  Wait Until Element Is Visible           id=cart-nav
  Click Element                           id=cart-nav
  Wait Until Element Is Visible           id=cart-section
  Element Should Be Visible               id=cart-details
  Wait Until Element Is Enabled           id=checkout-button
  Click Element                           id=checkout-button
  Sleep                                   2s
  ${checkout_summary}=    Handle Alert    timeout=10s
  Should Contain  ${checkout_summary}     2 VIP Adult Ticket(s) - $200
  Should Contain  ${checkout_summary}     2 VIP Child Ticket(s) - $120
  Should Contain  ${checkout_summary}     Total: $320
  Sleep                                   3s

