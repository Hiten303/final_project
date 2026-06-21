*** Settings ***
Resource  ../../resources/pages/register_page.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-REG-UI-01 Register User
    [Documentation]  Check that new user is regestered
    [Tags]  UI
    Register User
    Wait Until Page Contains
    ...    Your account was created successfully. You are now logged in.
    ...    10s
    Page Should Contain    Your account was created successfully. You are now logged in.

TC-REG-UI-02 Registration - Required field are empty
    [Documentation]  Check that user is not able to register when required fields are empty
    [Tags]  UI  NEGATIVE
    Register user with empty required fields

TC-REG-UI-03 Registration - Password and confirm password don't match
    [Documentation]  Check that user is not able to register when password and confirm password don't match
    [Tags]  UI  NEGATIVE
    Registration - Password and confirm mismatch

TC-REG-UI-04 Registration - Duplicate user
    [Documentation]  Check that no duplicate user are created
    [Tags]  UI   NEGATIVE
    Check login

    Log out
    Register User
    Wait Until Page Contains
    ...    This username already exists.
    ...    10s
    Page Should Contain    This username already exists.