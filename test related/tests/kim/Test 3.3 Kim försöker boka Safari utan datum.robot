*** Settings ***
Library    SeleniumLibrary 
Test Teardown  Close All Browsers

*** Variables ***
${URL}              file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html
${BROWSER}          Chrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${SAFARI_DATE}      002025-03-01  # Updated date format to match the application
${SAFARI_QUANTITY}  4

*** Test Cases ***

Test Safari Booking Without General Admission Tickets
    [Documentation]  Tests the scenario where a user tries to book a VIP Safari ticket without having general admission tickets.

    Given the browser is open on the correct URL
    When the user registers a new account
    And the user logs in with the new account
    And the user Navigates to 'Buy Tickets'
    And the user adds two Adult VIP tickets to Cart
    And the user adds two Children VIP tickets to Cart
    And Kim navigates to "Book Safaris"
    And Kim tries to confirm the booking without selecting a date
    Then an error message should be displayed

*** Keywords ***

the browser is open on the correct URL
    [Documentation]  Opens the browser and navigates to the Safari booking page.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


the user registers a new account
    [Documentation]  Clicks on 'Register' and registers a new user with valid credentials.

    Wait Until Element is Visible    id=register-nav
    Click Element    id=register-nav
    Wait Until Element is Visible    id=register-section
    Input Text    id=reg-username    ${USERNAME}
    Input Text    id=reg-password    ${PASSWORD}
    Click Element    xpath=//form[@id='register-form']//button[@type='submit']
    Sleep    2s

the user logs in with the new account
    [Documentation]  Logs in with the registered user.

    Wait Until Element Is Visible    id=login-nav
    Click Element    id=login-nav
    Wait Until Element is Visible    id=login-section
    Input Text    id=login-username    ${USERNAME} 
    Input Text    id=login-password    ${PASSWORD}
    Click Element    xpath=//form[@id='login-form']//button[@type='submit']
    Wait Until Element Is Visible    id=logout-nav
    Element Should Be Visible    id=cart-nav

the user Navigates to 'Buy Tickets'
    [Documentation]  Adds 2 Adult VIP tickets to the cart.

    Wait Until Element Is Visible    id=tickets-nav
    Click Element    id=tickets-nav
    Wait Until Element Is Visible    id=tickets-section


the user adds two Adult VIP tickets to Cart

    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert

the user Adds Two Children VIP Tickets to Cart
    [Documentation]  Adds 2 Children VIP tickets to the cart.

    Select From List By Value    id=ticket-type    Child
    Select From List By Value    id=ticket-category    VIP
    Input Text    id=ticket-quantity    2
    Click Element    xpath=//form[@id='ticket-form']//button[@type='submit']
    Handle Alert

Kim navigates to "Book Safaris"
    [Documentation]  Navigates to the Safari booking section.

    Wait Until Element Is Visible    id=safari-nav
    Click Element    id=safari-nav
    Wait Until Element Is Visible    id=safari-section

Kim tries to confirm the booking without selecting a date
    [Documentation]  Attempts to confirm the Safari booking without selecting a date.

    Select From List By Label    id=safari-type    ${SAFARI_TYPE}
    Click Element    xpath=//form[@id='safari-form']//button[@type='submit']

an error message should be displayed
    [Documentation]  Checks if the browser displays the required field error message.

    Click Element    xpath=//form[@id='safari-form']//button[@type='submit']
    Sleep    1s  # Vänta kort för att valideringen ska synas

    ${error_message}=    Execute JavaScript    return document.getElementById('safari-date').validationMessage;
    Should Be Equal As Strings    ${error_message}    Fyll i det här fältet.