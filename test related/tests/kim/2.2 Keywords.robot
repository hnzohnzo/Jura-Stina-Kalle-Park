*** Settings ***
Library  SeleniumLibrary 


*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome


*** Keywords ***

the browser is open on the correct URL
  [Documentation]                         Öppnar Browser och Rätt URL, Speed sat till 0.2s för att enklare hänga med visuellt.

  Open Browser  ${URL}  ${BROWSER} 
  Maximize Browser Window
  Set Selenium Speed                      0.2s

  
the user Navigates to 'Buy Tickets'
  [Documentation]                         -
  Set Selenium Speed                      0.5s
  Wait Until Element is Visible           xpath=//li[@id='tickets-nav']/a
  Click Element                           xpath=//li[@id='tickets-nav']/a


the user Attempts to Add Tickets Without Login
  [Documentation]    

  Wait Until Page Contains Element        id=ticket-category
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
 


Alert Message is Shown
  [Documentation]    

    ${alert_text}=    Handle Alert        ACCEPT
  Should Be Equal    ${alert_text}        You must be logged in to purchase tickets.
  Wait Until Page Contains Element        id=login-section