*** Settings ***
Library   SeleniumLibrary 
Resource  keywords.robot
Test Teardown  Close All Browsers

*** Test Cases ***

user attempts to buy VIP-Safari tickets without VIP-Access

  [Documentation]  Scenario: Kim attempts to buy VIP-Safari tickets without VIP-Access
  [Tags]  created_by:HannesSchönberg  functionality:VIP-Safari_tickets_purchase  status:Approved  type:negative

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user Attempts to Book Safari Without General Admission Tickets
  Then an Alert Message is Shown


