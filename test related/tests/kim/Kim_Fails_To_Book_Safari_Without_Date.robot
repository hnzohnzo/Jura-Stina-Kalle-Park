*** Settings ***
Library   SeleniumLibrary 
Resource    ../../resources/common.robot
Test Teardown  Close All Browsers

*** Test Cases ***

user attempts to book VIP-Safari tickets without choosing a Date

  [Documentation]  Scenario: Kim attempts to book VIP-Safari tickets without choosing a Date
  [Tags]  created_by:HannesSchönberg  functionality:VIP-Safari_tickets_purchase  status:Approved  type:negative

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user Navigates to 'Buy Tickets'
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  And the user navigates to "Book Safaris"
  And the user tries to confirm the booking without selecting a date
  Then an error message should be displayed
