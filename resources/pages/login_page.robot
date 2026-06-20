*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/login_locators.robot
Resource  ../keywords/common_keywords.robot

Resource  ../../variables/account_overview.robot
Resource    register_page.robot

*** Keywords ***
Login User
   [Documentation]   Log in registered user
   [Tags]  UI
    Input Text    ${login_username}    ${USER_NAME}
    Input Text    ${login_password}    ${USER_PWD}
    Click Element    ${log_in_button}

Login User With Invalid Data
   [Documentation]   Check that a user is not able to log in with invalid password
   [Tags]  UI  NEGATIVE
   Input Text    ${login_username}    ${USER_NAME}
   Input Text    ${login_password}     222
   Click Element    ${log_in_button}

Check login
    [Documentation]  Check user is registered or not 
    Login User
    ${login_failed}=  Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    The username and password could not be verified.
    ...    3s

    IF     ${login_failed}

        Register User

    END