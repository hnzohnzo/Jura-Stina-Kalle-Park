*** Settings ***
Documentation    Test cases for Stina-Palle registration and login functionality
Resource    ../common/stina-palle.robot

Test Setup    Open Browser To Main Page
Test Teardown     

*** Test Cases ***
1.1 - Successful Registration
    [Documentation]    Stina-Palle successfully registers an account
    [Tags]    registration    positive    Sumeyye
    Given Navigate To Registration Page
    When Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Then Page Should Contain    Registration successful
    [Teardown]
1.2 - Registration With Existing Username
    [Documentation]    Kim tries to register with already taken username
    [Tags]    registration    negative    Sumeyye
    
    Navigate To Registration Page
    Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Sleep    2s
    
    
    Given Navigate To Registration Page  
    When Fill Registration Form    ${STINA_USERNAME}    ${WRONG_PASSWORD}
    Then Wait Until Page Contains    Username already exists. Please choose another    timeout=10s

1.3 - Registration With Short Password
    [Documentation]    Stina-Palle tries to register with a too short password
    [Tags]    registration    negative    Sumeyye
    Given Navigate To Registration Page
    When Fill Registration Form    ${STINA_USERNAME}    ${SHORT_PASSWORD}
    Then Page Should Contain    Password must be at least 8 characters long

1.4 - Successful Login
    [Documentation]    Stina-Palle successfully logs into the website
    [Tags]    login    positive    Sumeyye
   
    Given Navigate To Registration Page
    And Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    And Wait Until Page Contains    Registration successful    timeout=10s
    And Page Should Contain    Registration successful
    Sleep    2s
    
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Sleep    2s
    Then Wait Until Element Is Visible    id=logout-nav    timeout=10s
    And Element Should Not Be Visible    id=login-nav

1.5 - Failed Login With Wrong Password
    [Documentation]    Stina-Palle tries to login with incorrect password
    [Tags]    login    negative    Sumeyye
    
    Given Navigate To Registration Page
    And Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    And Wait Until Page Contains    Registration successful    timeout=10s
    And Page Should Contain    Registration successful
    Sleep    2s
    
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${STINA_USERNAME}    ${WRONG_PASSWORD}
    Sleep    2s
    Then Wait Until Page Contains    Invalid username or password    timeout=10s