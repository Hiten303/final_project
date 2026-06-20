*** Settings ***
Library  SeleniumLibrary
Resource   ../../resources/keywords/common_keywords.robot
Resource   ../../resources/pages/validate_account_creation_page.robot
Resource    ../../resources/pages/register_page.robot
Resource    ../../variables/account_overview.robot
Resource    ../../resources/pages/login_page.robot
Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application
*** Test Cases ***
TC-AC-API-02 Validate Account Creation
    [Documentation]  Check that account creation is successful by validating account details from account id
    [Tags]  API
    Check login
    Validate Account Creation
    Log To Console    Account Created Successfully

TC-AC-API-03 Get Accounts from Customer Id
    [Documentation]  Check that account creation is successful by validating account details from customer id
    [Tags]  API
    Check login
    Get accounts from customer id

TC-AC-API-04 Validate account type and details
    [Documentation]  Validate account type and details via api
    [Tags]   API
    Check login
    Validate Account type and detaiils
    Log To Console    Account Type and Details Validated Successfully