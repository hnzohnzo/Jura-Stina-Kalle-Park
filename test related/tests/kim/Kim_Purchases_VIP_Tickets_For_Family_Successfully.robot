*** Settings ***
Library  SeleniumLibrary 
Resource    ../../resources/common.robot
Test Teardown  Close All Browsers

*** Test Cases ***

user successfully buys VIP-Tickets for the whole family

  [Documentation]  Kim successfully buys VIP-Tickets for her whole family on a weekend. 
  [Tags]  created_by:HannesSchönberg  functionality:VIP-tickets_purchase  status:Approved  type:positive

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user navigates to 'Buy Tickets' 
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  Then the user proceeds to checkout and sees the correct summary