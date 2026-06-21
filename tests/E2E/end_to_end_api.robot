register , login via api  can't be dont
register , login via ui
take the account id
take the customer id from the account id
make two account saving and checking account
transfer fund via api
validate the transfered fund via
log out via ui


register two differenct user
make one account for each user
get the account number for each user
transfer fund from one user to other user via api
and validate the fund tansfer via api
log out
*** Settings ***
Library   SeleniumLibrary
Library   RequestsLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/two_user_page.robot
Resource    ../../resources/pages/validate_account_creation_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/fund_transfer_api_page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-E2E-02 Fund transfer two user
        [Documentation]   Transfer fund from one user to other user
        [Tags]   E2E
        Register user with arguments    user1    paliwal    43    udaipur    rajasthan    323232    3434343434    11111    user1    333
        ${USER1_ACCOUNT_NUMBER}=  Get Account number
        ${BALANCE_1}=   Get Account balance    ${USER1_ACCOUNT_NUMBER}
        Log out
        Register user with arguments    user2    paliwal    43    udaipur    rajasthan    323232    3434343434    11111    user2    444
        ${USER2_ACCOUNT_NUMBER}=  Get Account number
        ${BALANCE_2}=   Get Account balance    ${USER2_ACCOUNT_NUMBER}
        ${BEFORE_BALANCE}=   Evaluate    ${BALANCE_1}+${BALANCE_2}
        Transfer fund via api       ${USER1_ACCOUNT_NUMBER}    ${USER2_ACCOUNT_NUMBER}     100
        ${BALANCE_3}=   Get Account balance    ${USER1_ACCOUNT_NUMBER}
        ${BALANCE_4}=   Get Account balance     ${USER2_ACCOUNT_NUMBER}
        ${AFTER_BALANCE}=   Evaluate    ${BALANCE_1}+${BALANCE_2}
        Should Be Equal As Integers    ${BEFORE_BALANCE}    ${AFTER_BALANCE}