*** Settings ***
Library    SeleniumLibrary 
Resource  3.1 Keywords.robot
Test Teardown    Close All Browsers

*** Variables ***
${URL}              file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}          Chrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${SAFARI_DATE}      002025-03-01  # Just nu statiskt datum, ändra till dynamiskt (om möjligt i tid)
${SAFARI_QUANTITY}  4

*** Test Cases ***

Complete Test
    [Documentation]  Tests the full booking process for a VIP safari on a dynamically chosen weekend date.

    Given the browser is open on the correct URL
    When the user registers a new account
    And the user logs in with the new account
    And the user Navigates to 'Buy Tickets'
    And the user adds two Adult VIP tickets to Cart
    And the user adds two Children VIP tickets to Cart
    And the user Adds Multiple Safaris to Cart    ${SAFARI_QUANTITY}
    And the user Proceeds to Checkout, Then the Checkout Summary is Shown

 