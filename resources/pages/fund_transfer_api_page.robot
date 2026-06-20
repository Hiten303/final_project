*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary

*** Keywords ***
Transfer fund via api
        [Documentation]    Transfer funds to other account via api
        [Tags]   API
        [Arguments]     ${from_account}    ${to_account}     ${amount}
        Create Session    transfer_fund    https://parabank.parasoft.com/parabank/services/bank
        ${header}=   Create Dictionary   Accept=application/json
        ${params}=   Create Dictionary
        ...   fromAccountId=${from_account}
        ...   toAccountId=${to_account}
        ...   amount=${amount}

        ${response}=   POST On Session   transfer_fund    /transfer   params=${params}     headers=${header}
            Status Should Be    200   ${response}
        Log To Console    fund transfered