*** Keywords ***
Navigate To Registration Page
    Click Element    css=a[data-section="register-section"]
    Wait Until Element Is Visible    id=register-form    timeout=10s

Enter Registration Details
    [Arguments]    ${username}    ${password}
    Input Text    id=reg-username    ${username}
    Input Text    id=reg-password    ${password}

Submit Registration Form
    Click Button    css=button[type="submit"]

Verify Registration Success
    Wait Until Element Is Visible    id=register-message    timeout=10s
    Element Should Contain    id=register-message    Registration successful

Verify Registration Error
    [Arguments]    ${error_message}
    Wait Until Element Is Visible    id=register-message    timeout=10s
    Element Should Contain    id=register-message    ${error_message}

Navigate To Login Page
    Click Element    css=a[data-section="login-section"]
    Wait Until Element Is Visible    id=login-form    timeout=10s

Enter Login Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=login-username    ${username}
    Input Text    id=login-password    ${password}

Click Login Button
    Click Button    css=button[type="submit"]

Verify Login Success
    Wait Until Element Is Visible    id=logout-nav    timeout=10s
    Element Should Be Visible    id=logout-nav

Verify Login Error
    [Arguments]    ${error_message}
    Wait Until Element Is Visible    id=login-message    timeout=10s
    Element Should Contain    id=login-message    ${error_message}