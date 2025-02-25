*** Settings ***
Library  SeleniumLibrary 
Test Teardown  Close All Browsers

*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome

*** Test Cases ***

Complete Test
  [Documentation]                         -

  Open Browser and URL
  Navigates and Clicks on 'Buy Tickets'
  Attempts to Add Tickets Without Login
  Alert Message is Shown

*** Keywords ***

Open Browser and URL
  [Documentation]                         Öppnar Browser och Rätt URL, Speed sat till 0.2s för att enklare hänga med visuellt.

  Open Browser  ${URL}  ${BROWSER} 
  Maximize Browser Window
  Set Selenium Speed                      0.2s

  
Navigates and Clicks on 'Buy Tickets'
  [Documentation]                         -
  Set Selenium Speed                      0.5s
  Wait Until Element is Visible           xpath=//li[@id='tickets-nav']/a
  Click Element                           xpath=//li[@id='tickets-nav']/a


Attempts to Add Tickets Without Login
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

