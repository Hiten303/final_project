*** Settings ***
Library   SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/pages/login_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/open_account_page.robot
Resource    ../../resources/pages/validate_account_creation_page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-TF-UI-01 Transfer Fund
       [Documentation]  Transfer valid fund to other account
       [Tags]  UI
       Check login
       ${ACCOUNT_ID_1}=  Open Savings Account
       ${ACCOUNT_ID_2}=  Open Savings Account
       Log To Console    ACCOUNT_ID_1='${ACCOUNT_ID_1}'
       Log To Console    ACCOUNT_ID_2='${ACCOUNT_ID_2}'
       ${BALANCE}=    Get Account balance      ${ACCOUNT_ID_1}
       Transfer fund to other account   ${ACCOUNT_ID_1}   ${ACCOUNT_ID_2}    ${BALANCE}
       Sleep    3s

TC-TF-UI-02 Transfer more fund than balance
       [Documentation]  Transfer more fund than balance to other account
       [Tags]  UI
       Check login
       ${ACCOUNT_ID_1}=  Open Savings Account
       ${ACCOUNT_ID_2}=  Open Savings Account
       Log To Console    ACCOUNT_ID_1='${ACCOUNT_ID_1}'
       Log To Console    ACCOUNT_ID_2='${ACCOUNT_ID_2}'
       ${BALANCE}=    Get Account balance    ${ACCOUNT_ID_1}
       ${VALUE}=     Evaluate    ${BALANCE}+1
       Transfer fund to other account   ${ACCOUNT_ID_1}   ${ACCOUNT_ID_2}    ${VALUE}
       Sleep    3s

TC-TF-UI-03 Transfer negative funds
       [Documentation]  Transfer negative funds to other account
       [Tags]  UI
       Check login
       ${ACCOUNT_ID_1}=  Open Savings Account
       ${ACCOUNT_ID_2}=  Open Savings Account

       Transfer fund to other account    ${ACCOUNT_ID_1}   ${ACCOUNT_ID_2}    -100

       Sleep    3s

TC-TF-UI-04 Transfer valid amount to self account
       [Documentation]  Transfer fund to self account
       [Tags]  UI
       Check login
       ${ACCOUNT_ID_1}=  Open Savings Account
       ${BALANCE}=    Get Account balance     ${ACCOUNT_ID_1}
       Transfer fund to same account    ${ACCOUNT_ID_1}    ${BALANCE}
       Sleep    3s

TC-TF-UI-05 Transfer invalid amount to self account
       [Documentation]  Transfer negative funds
       [Tags]  UI
       Check login
       ${ACCOUNT_ID_1}=  Open Savings Account
       ${BALANCE}=    Get Account balance     ${ACCOUNT_ID_1}
       Transfer fund to same account    ${ACCOUNT_ID_1}    -100

TC-TF-UI-05 Validate balance
       [Documentation]   Validate balance consistency before and after fund transfer
       [Tags]   Hybrid
       Check login

       ${ACCOUNT_ID_1}=  Open Savings Account
       ${account_1_before_balance}=    Get Account balance    ${ACCOUNT_ID_1}
       ${ACCOUNT_ID_2}=  Open Savings Account
       ${account_2_before_balance}=    Get Account balance    ${ACCOUNT_ID_2}
       ${total_balance_before}=   Evaluate     ${account_1_before_balance}+${account_2_before_balance}
       Transfer fund to other account    ${ACCOUNT_ID_1}   ${ACCOUNT_ID_2}    ${account_1_before_balance}
       ${account_1_after_balance}=    Get Account balance    ${ACCOUNT_ID_1}
       ${account_2_after_balance}=    Get Account balance    ${ACCOUNT_ID_2}
       ${total_after_balance}=   Evaluate    ${account_1_after_balance}+${account_2_after_balance}

       Should Be Equal As Integers    ${total_after_balance}    ${total_balance_before}
       Log To Console    balance is consistent

