*** Settings ***
Library   SeleniumLibrary 
Resource  keywords.robot
Test Teardown  Close All Browsers

*** Test Cases ***

user successfully purchases VIP-Safari tickets on a weekend

  [Documentation]  Scenario: Kim successfully purchases VIP-Safari tickets on a weekend
  [Tags]  created_by:HannesSchönberg  functionality:VIP-Safari_tickets_purchase  status:Approved  type:positive

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user navigates to 'Buy Tickets'
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  And the user adds multiple Safaris to Cart    ${SAFARI_QUANTITY}
  And the user Proceeds to Checkout, Then the Checkout Summary is Shown

 