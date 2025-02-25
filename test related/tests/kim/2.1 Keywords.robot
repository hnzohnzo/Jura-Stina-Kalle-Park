*** Settings ***
Library  SeleniumLibrary 

*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome
${USERNAME}                               KimUsername
${PASSWORD}                               KimPassword123


*** Keywords ***

the browser is open on the correct URL

  [Documentation]                         Öppnar Browser och Rätt URL, Speed sat till 0.2s för att enklare hänga med visuellt.
  Open Browser  ${URL}  ${BROWSER} 
  Maximize Browser Window
  Set Selenium Speed                      0.2s

the user registers a new account
  [Documentation]                         Klickar på 'Register' och registrerar en användare med korrekta uppgifter
  Wait Until Element is Visible           id=register-nav
  Click Element                           id=register-nav
  Wait Until Element is Visible           id=register-section
  Input Text                              id=reg-username  ${USERNAME} 
  Input Text                              id=reg-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='register-form']//button[@type='submit'] 
  Sleep                                   2s

the user logs in with the new account
  [Documentation]                         Klickar på 'Login' och loggar in med nyligen registrerad användare.
  Wait Until Element Is Visible           id=login-nav
  Click Element                           id=login-nav
  Wait Until Element Is Visible           id=login-section
  Input Text                              id=login-username  ${USERNAME}
  Input Text                              id=login-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='login-form']//button[@type='submit']
  Wait Until Element Is Visible           id=logout-nav
  Element Should Be Visible               id=cart-nav

the user navigates to 'Buy Tickets' 
  [Documentation]                         Klickar på 'Buy Tickets' och lägger till 2st Adult VIP Tickets till varukorgen.
  Wait Until Element Is Visible           id=tickets-nav
  Click Element                           id=tickets-nav
  Wait Until Element Is Visible           id=tickets-section

the user adds two Adult VIP tickets
  [Documentation]                         Lägger till 2st Adult VIP Tickets till varukorgen.
  Select From List By Value               id=ticket-type    Adult
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert

the user adds two Children VIP tickets
  [Documentation]                         Lägger till 2st Children VIP tickets till varukorgen.
  Select From List By Value               id=ticket-type    Child
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert

the user proceeds to checkout and sees the correct summary
  [Documentation]                         Klickar på 'Cart' och sedan på 'Proceed to Checkout'
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