*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Resource  ../../variables/account_overview.robot



*** Keywords ***

Get Account number
    [Documentation]  Get account number
    [Tags]  UI
    Click Element    ${account_overview}
    Wait Until Element Is Visible    ${account_number_link}
    Click Element    ${account_number_link}
    Wait Until Element Is Visible    xpath=//td[@id='accountId']  10s
    sleep  5s
    ${account_number}=    Get Text    xpath=//td[@id='accountId']
    RETURN     ${account_number}

Get Account type
    [Documentation]  Get account details
    [Tags]  UI
    Click Element    ${account_overview}
    Wait Until Element Is Visible    ${account_number_link}
    Click Element    ${account_number_link}
    Wait Until Element Is Visible    xpath=//td[@id='accountType']   10s
    sleep  3s
    ${account_type}=    Get Text    xpath=//td[@id='accountType']
    RETURN    ${account_type}

#Get Account balance
#    [Documentation]  Validate account creation from account id
#    [Tags]  API
#    ${ACCOUNT_NUMBER}=  Get Account number
#    Create Session    get_balance    https://parabank.parasoft.com/parabank/services/bank
#
#    ${headers}=    Create Dictionary    Accept=application/json
#    ${response}=   GET On Session    get_balance    /accounts/${ACCOUNT_NUMBER}    headers=${headers}
#    Status Should Be    200  ${response}
#    ${json_response}=  Set Variable    ${response.json()}
#    RETURN      ${json_response}[balance]

Get Account balance
    [Documentation]    Get Account balance from account id via api
    [Tags]  API
    [Arguments]    ${ACCOUNT_NUMBER}
#    ${ACCOUNT_NUMBER}=  Get Account number
    Create Session    get_balance    https://parabank.parasoft.com/parabank/services/bank

    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=   GET On Session    get_balance    /accounts/${ACCOUNT_NUMBER}    headers=${headers}
    Status Should Be    200  ${response}
    ${json_response}=  Set Variable    ${response.json()}
    RETURN      ${json_response}[balance]


Validate Account Creation
    [Documentation]  Validate account creation from account id
    [Tags]  API
    ${ACCOUNT_NUMBER}=  Get Account number
    Log To Console    account number is = ${ACCOUNT_NUMBER}
    Create Session    account_validation    https://parabank.parasoft.com/parabank/services/bank

    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=   GET On Session    account_validation    /accounts/${ACCOUNT_NUMBER}    headers=${headers}
    Status Should Be    200  ${response}

Get Customer id
    [Documentation]  Validate account creation from account id
    [Tags]  API
    ${ACCOUNT_NUMBER}=  Get Account number

    Create Session    get_id    https://parabank.parasoft.com/parabank/services/bank

    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=   GET On Session    get_id    /accounts/${ACCOUNT_NUMBER}    headers=${headers}
    Status Should Be    200  ${response}
    ${json_response}=  Set Variable    ${response.json()}
    RETURN      ${json_response}[customerId]

#Get Customer id
#    [Documentation]  Validate account creation from account id
#    [Tags]  API
#    [Arguments]    ${ACCOUNT_NUMBER}
#    Create Session    get_id    https://parabank.parasoft.com/parabank/services/bank
#
#    ${headers}=    Create Dictionary    Accept=application/json
#    ${response}=   GET On Session    get_id    /accounts/${ACCOUNT_NUMBER}    headers=${headers}
#    Status Should Be    200  ${response}
#    ${json_response}=  Set Variable    ${response.json()}
#    RETURN      ${json_response}[customerId]

Get accounts from customer id
    [Documentation]   Get accounts from customer id
    [Tags]  API
    ${CUSTOMER_ID}=  Get Customer id

    Create Session    get_accounts    https://parabank.parasoft.com/parabank/services/bank
    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=   GET On Session    get_accounts    /customers/${CUSTOMER_ID}/accounts     headers=${headers}
    Log To Console    Status Code = ${response.status_code}
    Log To Console    Response = ${response.text}
    Status Should Be    200   ${response}
    ${customer_accounts}=  Set Variable    ${response.json()}

Validate Account type and detaiils
    [Documentation]  validate account type and details
    [Tags]   API
    ${ACCOUNT_NUMBER}=  Get Account number
    ${ACCOUNT_TYPE}=   Get Account type
    ${ACCOUNT_BALANCE}=   Get Account balance    ${ACCOUNT_NUMBER}
    Create Session    account_type_details    https://parabank.parasoft.com/parabank/services/bank
    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=   GET On Session    account_type_details    /accounts/${ACCOUNT_NUMBER}       headers=${headers}
    Log To Console    Status Code = ${response.status_code}
    Log To Console    Response = ${response.text}
    Log To Console    account balance = ${ACCOUNT_BALANCE}
    Status Should Be    200   ${response}
    ${account_details}=  Set Variable    ${response.json()}
    Should Be Equal As Integers    ${ACCOUNT_NUMBER}    ${account_details}[id]
    Should Be Equal    ${ACCOUNT_TYPE}    ${account_details}[type]
