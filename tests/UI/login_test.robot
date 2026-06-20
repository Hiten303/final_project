*** Settings ***
Resource  ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-06 Login User
    [Documentation]  Check that a user is able to login
    [Tags]  UI
    Login User

TC-REG-UI-07 User login - invalid data
    [Documentation]   Check that a user is not able to login with invalid password
    [Tags]  UI  NEGATIVE
    Login User With Invalid Data
    sleep   1s
    Page Should Contain   The username and password could not be verified.