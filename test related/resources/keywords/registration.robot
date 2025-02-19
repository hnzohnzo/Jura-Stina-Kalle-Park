*** Settings ***
Library  SeleniumLibrary
Resource  ../variables/urls.yaml

*** Keywords ***
Register New User
    [Arguments]  ${USERNAME}  ${PASSWORD}
    Click Element  id=register-nav
    Wait Until Element Is Visible  id=register-form
    Input Text  id=reg-username  ${USERNAME}
    Input Text  id=reg-password  ${PASSWORD}
    Click Button  id=register-form
    Wait Until Element Is Visible  id=register-message
    Element Should Contain  id=register-message  Registration successful