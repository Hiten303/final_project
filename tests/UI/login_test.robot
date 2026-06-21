*** Settings ***
Resource  ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-LOG-UI-01 Login User
    [Documentation]  Check that a user is able to login with valid credentials
    [Tags]  UI
    Login User

TC-LOG-UI-02 User login - invalid data
    [Documentation]   Check that a user is not able to login with invalid password
    [Tags]  UI  NEGATIVE
    Login User With Invalid Data
    Wait Until Page Contains    The username and password could not be verified.
    Page Should Contain   The username and password could not be verified.