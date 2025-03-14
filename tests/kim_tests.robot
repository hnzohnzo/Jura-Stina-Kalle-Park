*** Settings ***
Library   SeleniumLibrary 
Resource    ${EXECDIR}/resources/keyword_files/Keywords_Kim.robot
Test Teardown  Close All Browsers


*** Test Cases ***

user successfully purchases VIP-Safari tickets on a weekend

  [Documentation]  Scenario: Kim successfully purchases VIP-Safari tickets on a weekend
  [Tags]  HannesSchonberg    new-feature

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user navigates to 'Buy Tickets'
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  And the user adds multiple Safaris to Cart    ${SAFARI_QUANTITY}
  And the user Proceeds to Checkout, Then the Checkout Summary is Shown


*** Test Cases ***

user attempts to book VIP-Safari tickets without choosing a Date

  [Documentation]  Scenario: Kim attempts to book VIP-Safari tickets without choosing a Date
  [Tags]  HannesSchonberg    new-feature

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user Navigates to 'Buy Tickets'
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  And the user navigates to "Book Safaris"
  And the user tries to confirm the booking without selecting a date
  Then an error message should be displayed


*** Test Cases ***

user attempts to buy VIP-Safari tickets without VIP-Access

  [Documentation]  Scenario: Kim attempts to buy VIP-Safari tickets without VIP-Access
  [Tags]  HannesSchonberg    new-feature

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user Attempts to Book Safari Without General Admission Tickets
  Then an Alert Message is Shown


*** Test Cases ***

user attempts to buy VIP-Tickets without login

  [Documentation]  Scenario: Kim attempts to buy VIP-Tickets without login
  [Tags]  HannesSchonberg    new-feature

  Given the browser is open on the correct URL
  And the user navigates to 'Buy Tickets'
  And the user attempts to Add Tickets Without Login
  Then Alert message is Shown


*** Test Cases ***

user successfully buys VIP-Tickets for the whole family

  [Documentation]  Kim successfully buys VIP-Tickets for her whole family on a weekend. 
  [Tags]  HannesSchonberg   new-feature

  Given the browser is open on the correct URL
  When the user registers a new account
  And the user logs in with the new account
  And the user navigates to 'Buy Tickets' 
  And the user adds two Adult VIP tickets to Cart
  And the user adds two Children VIP tickets to Cart
  Then the user proceeds to checkout and sees the correct summary
