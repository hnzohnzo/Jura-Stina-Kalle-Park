*** Settings ***
Library  SeleniumLibrary 
Test Teardown  Close All Browsers
Resource  2.2 Keywords.robot

*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome

*** Test Cases ***

Complete Test
  [Documentation]                         Hela Test Processen Från Registrering Till Felmeddelande vid Försök av Köp.

  Given the browser is open on the correct URL
  And the user Navigates to 'Buy Tickets'
  And the user Attempts to Add Tickets Without Login
  Then Alert Message is Shown



