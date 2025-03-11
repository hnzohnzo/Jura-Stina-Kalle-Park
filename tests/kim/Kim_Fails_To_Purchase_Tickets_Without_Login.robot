*** Settings ***
Library  SeleniumLibrary 
Resource    ./keyword_files/Keywords_Kim.robot
Test Teardown  Close All Browsers

*** Test Cases ***

user attempts to buy VIP-Tickets without login

  [Documentation]  Scenario: Kim attempts to buy VIP-Tickets without login
  [Tags]  created_by:HannesSchönberg  functionality:VIP-tickets_purchase  status:Approved  type:negative

  Given the browser is open on the correct URL
  And the user navigates to 'Buy Tickets'
  And the user attempts to Add Tickets Without Login
  Then Alert message is Shown



