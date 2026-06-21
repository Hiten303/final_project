*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/pages/login_page.robot
Resource    ../../resources/pages/open_account_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/validate_account_creation_page.robot

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application



*** Test Cases ***
TC-E2E-UI-01 End to end ui
         [Documentation]    end to end process via ui
         [Tags]   UI
         Check login
         ${ACCOUNT_ID_1}   Open Savings Account
         ${ACCOUNT_ID_2}   Open Savings Account
         ${BALANCE_1}=   Get Account balance     ${ACCOUNT_ID_1}
         ${BALANCE_2}=   Get Account balance     ${ACCOUNT_ID_2}
         ${BEFORE_BALANCE}=   Evaluate    ${BALANCE_1}+${BALANCE_2}
         Transfer fund to other account    ${ACCOUNT_ID_1}    ${ACCOUNT_ID_2}    100
         ${BALANCE_3}=   Get Account balance     ${ACCOUNT_ID_1}
         ${BALANCE_4}=   Get Account balance     ${ACCOUNT_ID_2}
         ${AFTER_BALANCE}=   Evaluate    ${BALANCE_3}+${BALANCE_4}
         Should Be Equal As Integers    ${BEFORE_BALANCE}    ${AFTER_BALANCE}
         Log out

