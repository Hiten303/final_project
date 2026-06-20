*** Settings ***
Library  SeleniumLibrary
Library   RequestsLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/open_account_page.robot
Resource    ../../resources/pages/fund_transfer_api_page.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application


*** Test Cases ***
TC-AC-API-02 Fund Transfer via api
    [Documentation]  Check fund transfer via api
    [Tags]  API
    Check login
    ${ACCOUNT_ID_1}=  Open Savings Account
    ${ACCOUNT_ID_2}=  Open Savings Account
    Transfer fund via api    ${ACCOUNT_ID_1}    ${ACCOUNT_ID_2}    50



