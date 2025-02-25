*** Settings ***
Library    SeleniumLibrary 
Resource  3.2 Keywords.robot
Test Teardown    Close All Browsers

*** Variables ***
${URL}              file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}          Chrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${SAFARI_DATE}      002025-03-01
${alert_text}  

*** Test Cases ***

Test Safari Booking Without General Admission Tickets
    [Documentation]  Tests the scenario where a user tries to book a VIP Safari ticket without having general admission tickets.

    Given the browser is open on the correct URL
    When the user registers a new account
    And the user logs in with the new account
    And the user Attempts to Book Safari Without General Admission Tickets
    Then Alert Message is Shown


