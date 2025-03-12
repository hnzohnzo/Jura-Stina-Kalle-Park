*** Settings ***
Documentation    Common test cases for registration and login functionality
Resource    ./Users/mac/Jura-Stina-Kalle-Park/resources/keyword_files/common_keywords.robot
Resource    ../resources/variables/common_variables.robot
Test Setup    Open Browser To Main Page
Test Teardown    Close All Browsers

*** Test Cases ***
1.1 - Kim Successful Registration
    [Documentation]    Kim successfully registers an account
    [Tags]    registration    positive    kim    created_by:sumeyyesaglam
    Given Navigate To Registration Page
    When Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Then Page Should Contain    Registration successful

1.2 - Kim Registration With Existing Username
    [Documentation]    Kim tries to register with already taken username
    [Tags]    registration    negative    kim    created_by:sumeyyesaglam
    # First registration
    Navigate To Registration Page
    Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Sleep    2s
    
    # Try to register again with the same username
    Navigate To Registration Page  
    Fill Registration Form    ${KIM_USERNAME}    ${WRONG_PASSWORD}
    Wait Until Page Contains    Username already exists. Please choose another    timeout=10s

1.3 - Kim Registration With Short Password
    [Documentation]    Kim tries to register with a too short password
    [Tags]    registration    negative    kim    created_by:sumeyyesaglam
    Given Navigate To Registration Page
    When Fill Registration Form    ${KIM_USERNAME}    ${KIM_SHORT_PASSWORD}
    Then Page Should Contain    Password must be at least 8 characters long

1.4 - Kim Successful Login
    [Documentation]    Kim successfully logs into the website
    [Tags]    login    positive    kim    created_by:sumeyyesaglam
    # First register
    Given Navigate To Registration Page
    And Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    And Page Should Contain    Registration successful
    Sleep    2s
        
    # Then login
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    Sleep    2s
    
    Then Wait Until Element Is Visible    id=logout-nav    timeout=10s
    And Element Should Not Be Visible    id=login-nav

1.5 - Kim Failed Login With Wrong Password
    [Documentation]    Kim tries to login with incorrect password
    [Tags]    login    negative    kim    created_by:sumeyyesaglam
    # First register  
    Given Navigate To Registration Page
    And Fill Registration Form    ${KIM_USERNAME}    ${KIM_PASSWORD}
    And Page Should Contain    Registration successful
    Sleep    2s
          
    # Try to login with wrong password
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${KIM_USERNAME}    ${KIM_WRONG_PASSWORD}
    Sleep    2s
    
    Then Wait Until Page Contains    Invalid username or password    timeout=10s

2.1 - Stina-Palle Successful Registration
    [Documentation]    Stina-Palle successfully registers an account
    [Tags]    registration    positive    stina-palle    created_by:sumeyyesaglam
    Given Navigate To Registration Page
    When Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Then Page Should Contain    Registration successful

2.2 - Stina-Palle Registration With Existing Username
    [Documentation]    Stina-Palle tries to register with already taken username
    [Tags]    registration    negative    stina-palle    created_by:sumeyyesaglam
    # First registration
    Navigate To Registration Page
    Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Sleep    2s
    
    # Try to register again with the same username
    Given Navigate To Registration Page
    When Fill Registration Form    ${STINA_USERNAME}    ${STINA_WRONG_PASSWORD}
    Then Wait Until Page Contains    Username already exists. Please choose another    timeout=10s

2.3 - Stina-Palle Registration With Short Password
    [Documentation]    Stina-Palle tries to register with a too short password
    [Tags]    registration    negative    stina-palle    created_by:sumeyyesaglam
    Given Navigate To Registration Page
    When Fill Registration Form    ${STINA_USERNAME}    ${STINA_SHORT_PASSWORD}
    Then Page Should Contain    Password must be at least 8 characters long

2.4 - Stina-Palle Successful Login
    [Documentation]    Stina-Palle successfully logs into the website
    [Tags]    login    positive    stina-palle    created_by:sumeyyesaglam
    # First register
    Given Navigate To Registration Page
    And Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    And Wait Until Page Contains    Registration successful    timeout=10s
    And Page Should Contain    Registration successful
    Sleep    2s
    
    # Then login
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    Sleep    2s
    
    Then Wait Until Element Is Visible    id=logout-nav    timeout=10s
    And Element Should Not Be Visible    id=login-nav

2.5 - Stina-Palle Failed Login With Wrong Password
    [Documentation]    Stina-Palle tries to login with incorrect password
    [Tags]    login    negative    stina-palle    created_by:sumeyyesaglam
    # First register
    Given Navigate To Registration Page
    And Fill Registration Form    ${STINA_USERNAME}    ${STINA_PASSWORD}
    And Wait Until Page Contains    Registration successful    timeout=10s
    And Page Should Contain    Registration successful
    Sleep    2s
    
    # Try to login with wrong password
    When Navigate To Login Page
    And Wait Until Element Is Visible    id=login-username    timeout=10s
    And Fill Login Form    ${STINA_USERNAME}    ${STINA_WRONG_PASSWORD}
    Sleep    2s
    
    Then Wait Until Page Contains    Invalid username or password    timeout=10s