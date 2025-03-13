*** Settings ***
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/variables/Variables_Kim.robot

*** Keywords ***

the browser is open on the correct URL
  [Documentation]                         Browser opens, the correct URL loads, Browser window set to maximum, Selenium speed set to 0.2s.
  [Tags]                                  created_by:HannesSchönberg

  Open Browser  ${URL}  ${BROWSER} 
  Maximize Browser Window

# # # 

the user registers a new account
  [Documentation]                         The user successfully registers a new account with valid credentials.
  [Tags]                                  created_by:HannesSchönberg

  Wait Until Element is Visible           id=register-nav
  Click Element                           id=register-nav
  Wait Until Element is Visible           id=register-section
  Input Text                              id=reg-username  ${USERNAME} 
  Input Text                              id=reg-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='register-form']//button[@type='submit'] 
  Sleep                                   2s

# # # 

the user logs in with the new account
  [Documentation]                         The user successfully login with new account
  [Tags]                                  created_by:HannesSchönberg

  Wait Until Element Is Visible           id=login-nav
  Click Element                           id=login-nav
  Wait Until Element Is Visible           id=login-section
  Input Text                              id=login-username  ${USERNAME}
  Input Text                              id=login-password  ${PASSWORD}
  Click Element                           xpath=//form[@id='login-form']//button[@type='submit']
  Wait Until Element Is Visible           id=logout-nav
  Element Should Be Visible               id=cart-nav

# # # 

the user navigates to 'Buy Tickets' 
  [Documentation]                         The user navigate and clicks on 'Buy Tickets'
  [Tags]                                  created_by:HannesSchönberg

  Wait Until Element Is Visible           id=tickets-nav
  Click Element                           id=tickets-nav
  Wait Until Element Is Visible           id=tickets-section

# # # 

the user Attempts to Add Tickets Without Login
  [Documentation]                         The user attempts to add two VIP-Tickets to cart without login.
  [Tags]                                  created_by:HannesSchönberg

  Wait Until Page Contains Element        id=ticket-category
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']

# # # 

Alert Message is Shown  
  [Documentation]                         Alert message is shown when trying to buy VIP-Tickets without login.
  [Tags]                                  created_by:HannesSchönberg

    ${alert_text}=    Handle Alert        ACCEPT
  Should Be Equal    ${alert_text}        You must be logged in to purchase tickets.
  Wait Until Page Contains Element        id=login-section

# # # 

an Alert Message is Shown
    [Documentation]    Checks if the alert message is shown when trying to book Safari without general admission tickets.

    Run Keyword And Ignore Error    Handle Alert    ACCEPT
    Wait Until Page Contains Element    id=tickets-nav
    Click Element    id=tickets-nav
# # # 

the user adds two Adult VIP tickets to Cart
  [Documentation]                         The user successfully adds two Adult VIP-Tickets to cart
  [Tags]                                  created_by:HannesSchönberg

  Select From List By Value               id=ticket-type    Adult
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert

# # # 

the user adds two Children VIP tickets to Cart
  [Documentation]                         The user successfully adds two Children VIP-Tickets to cart
  [Tags]                                  created_by:HannesSchönberg

  Select From List By Value               id=ticket-type    Child
  Select From List By Value               id=ticket-category    VIP
  Input Text                              id=ticket-quantity    2
  Click Element                           xpath=//form[@id='ticket-form']//button[@type='submit']
  Handle Alert

# # #

the user proceeds to checkout and sees the correct summary
  [Documentation]                         The user navigate and clicks on 'Cart', then 'Proceed to Checkout'.
  [Tags]                                  created_by:HannesSchönberg

  Wait Until Element Is Visible           id=cart-nav
  Click Element                           id=cart-nav
  Wait Until Element Is Visible           id=cart-section
  Element Should Be Visible               id=cart-details
  Wait Until Element Is Enabled           id=checkout-button
  Click Element                           id=checkout-button
  Sleep                                   2s
  ${checkout_summary}=    Handle Alert    timeout=10s
  Should Contain  ${checkout_summary}     2 VIP Adult Ticket(s) - $200
  Should Contain  ${checkout_summary}     2 VIP Child Ticket(s) - $120
  Should Contain  ${checkout_summary}     Total: $320
  Sleep                                   3s

# # # 

the user navigates to "Book Safaris"
  [Documentation]                         The user navigate and clicks on 'Book Safaris'
  [Tags]                                  created_by:HannesSchönberg

    Wait Until Element Is Visible         id=safari-nav
    Click Element                         id=safari-nav
    Wait Until Element Is Visible         id=safari-section

# # # 

the user Attempts to Book Safari Without General Admission Tickets
  [Documentation]                         The user attempts to book VIP-Safari without having general admission tickets.
  [Tags]                                  created_by:HannesSchönberg

    Wait Until Element Is Visible         id=safari-nav
    Click Element                         id=safari-nav
    Wait Until Element Is Visible         id=safari-section
    Input Text                            id=safari-date    ${SAFARI_DATE} 
    Select From List By Label             id=safari-type    ${SAFARI_TYPE}
    Click Element                         xpath=//form[@id='safari-form']//button[@type='submit']

# # # 

the user Adds Multiple Safaris to Cart
  [Documentation]                         The user adds multiple Safari-Tickets to the cart.
  [Tags]                                  created_by:HannesSchönberg
  [Arguments]    ${quantity}

    Wait Until Element Is Visible         id=safari-nav
    Click Element                         id=safari-nav
    Wait Until Element Is Visible         id=safari-section

    FOR    ${i}    IN RANGE    ${quantity}
        Input Text                        id=safari-date    ${SAFARI_DATE} 
        Select From List By Label         id=safari-type    ${SAFARI_TYPE}
        Click Element                     xpath=//form[@id='safari-form']//button[@type='submit']
        Handle Alert                      action=ACCEPT    timeout=5s 
        Sleep                             1s  
    END

# # # 

the user Proceeds to Checkout, Then the Checkout Summary is Shown
  [Documentation]                         The user navigates and proceeds to checkout and verifies the checkout summary.
  [Tags]                                  created_by:HannesSchönberg

    Wait Until Element Is Visible         id=cart-nav
    Click Element                         id=cart-nav
    Wait Until Element Is Visible         id=cart-section
    Element Should Be Visible             id=cart-details
    Wait Until Element Is Enabled         id=checkout-button
    Click Element                         id=checkout-button
    Sleep                                 2s
    ${checkout_summary}=    Handle Alert  timeout=10s
    Should Contain   ${checkout_summary}  2 VIP Adult Ticket(s) - $200
    Should Contain   ${checkout_summary}  2 VIP Child Ticket(s) - $120
    Should Contain   ${checkout_summary}  T-Rex Rumble eXtreme Thrill Pack on ${EXPECTED_DATE} - $220
    Should Contain   ${checkout_summary}  Total: $1200
    Sleep                                 3s

# # # 

the user tries to confirm the booking without selecting a date
  [Documentation]                         The user attempts to confirm the Safari booking without selecting a date.
  [Tags]                                  created_by:HannesSchönberg

    Select From List By Label             id=safari-type    ${SAFARI_TYPE}
    Click Element                         xpath=//form[@id='safari-form']//button[@type='submit']

# # # 

an error message should be displayed
  [Documentation]                         The System checks if the browser displays the required field error message.
  [Tags]                                  created_by:HannesSchönberg

    Click Element                         xpath=//form[@id='safari-form']//button[@type='submit']
    Sleep                                 1s 

    ${error_message}=  Execute JavaScript  return document.getElementById('safari-date').validationMessage;
    Should Be Equal As Strings  ${error_message}    Please fill out this field.

# # # 

