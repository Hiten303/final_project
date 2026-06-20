*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/pages/open_account_page.robot
Resource   ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application
*** Test Cases ***
TC-REG-UI-04 Open Checking Account
    [Documentation]  Check that a user is able to open checking account
    [Tags]  UI
    Check login
    Open Checking Account


TC-REG-UI-05 Open Savings Account
    [Documentation]  Check that user is able to open saving account
    [Tags]  UI
    Check login
    Open Savings Account