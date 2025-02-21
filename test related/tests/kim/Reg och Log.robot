*** Settings ***
Documentation    Test cases for Kim registration and login functionality
Resource    file:///C:/Users/Hanzoni/Desktop/Jura-Stina-Kalle/website/jurap.html 
Test Setup    Open Browser
Test Teardown    Close All Browsers

*** Test Cases ***
1.1 - Successful Registration
    [Documentation]    Kim successfully registers an account
    [Tags]    registration    positive    Sumeyye
    Given Navigate To Registration Page
    When Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Then Page Should Contain    Registration successful

1.2 - Registration With Existing Username
    [Documentation]    Kim tries to register with already taken username
    [Tags]    registration    negative    Sumeyye
    
    # Önce kullanıcıyı oluşturalım
    Navigate To Registration Page
    Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Sleep    2s
    
    # Şimdi aynı kullanıcı adıyla tekrar kayıt olmayı deneyelim
    Navigate To Registration Page  
    Fill Registration Form    ${KIM_USERNAME}    ${WRONG_PASSWORD}
    Wait Until Page Contains    Username already exists. Please choose another    timeout=10s

1.3 - Registration With Short Password
    [Documentation]    Kim tries to register with a too short password
    [Tags]    registration    negative    Sumeyye
    Given Navigate To Registration Page
    When Fill Registration Form    ${KIM_USERNAME}    ${SHORT_PASSWORD}
    Then Page Should Contain    Password must be at least 8 characters long

1.4 - Successful Login
    [Documentation]    Kim successfully logs into the website
    [Tags]    login    positive    Sumeyye
    Given Navigate To Login Page
    When Fill Login Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Then Element Should Be Visible    id=logout-nav
    

1.5 - Failed Login With Wrong Password
    [Documentation]    Kim tries to login with incorrect password
    [Tags]    login    negative    Sumeyye
    Given Navigate To Login Page
    When Fill Login Form    ${KIM_USERNAME}    ${WRONG_PASSWORD}
    Then Page Should Contain    Invalid username or password    timeout=10s