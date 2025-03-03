*** Settings ***
Documentation    [created_by:MoaRosvall] Keywords for all tests run in stina-palle_tickets.robot and stina-palle_safari.robot
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}    ${browser}    ${title}
    Open Browser    ${url}    ${browser}
    Title Should Be    ${title}
    
Type In Wanted Username
    [Arguments]    ${id_reg-username_element}    ${username}
    Input Text    ${id_reg-username_element}    ${username}

Type In Wanted Password
    [Arguments]    ${id_reg-password_element}    ${password}
    Input Text    ${id_reg-password_element}    ${password}

Type In Quantity
    [Arguments]    ${id_quantity_element}    ${quantity}
    Input Text    ${id_quantity_element}    ${quantity}

Type In Date
    [Arguments]    ${id_date_element}    ${date}
    Input Text    ${id_date_element}    ${date}

Message Should Be Visible
    [Arguments]    ${error_message_element}    ${error_message_text}    ${timeout}
    Wait Until Element Is Visible    ${error_message_element}    ${timeout}
    Element Text Should Be    ${error_message_element}    ${error_message_text}    