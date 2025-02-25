*** Settings ***
Library  SeleniumLibrary 
Test Teardown  Close All Browsers
Resource  2.1 Keywords.robot

*** Variables ***
${URL}                                    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}                                Chrome
${USERNAME}                               KimUsername
${PASSWORD}                               KimPassword123

*** Test Cases ***

Complete Test
  [Documentation]                         Hela Test Processen Från Registrering Till Köp av VIP-Biljetter

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user navigates to 'Buy Tickets' 
  And the user adds two Adult VIP tickets
  And the user adds two Children VIP tickets
  Then the user proceeds to checkout and sees the correct summary