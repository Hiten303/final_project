*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/transfer_funds_locators.robot

*** Keywords ***
Transfer fund to same account
    [Documentation]  transfer funds
    [Tags]   UI
    [Arguments]     ${FIRST_ACCOUNT}      ${VALUE}
    Click Element    ${transfer_funds}
    Input Text    ${amount}    ${VALUE}
    Wait Until Page Contains Element    xpath=//select[@id='fromAccountId']/option   10s
    Select From List By Value    ${from_account}    ${FIRST_ACCOUNT}

    Wait Until Page Contains Element    xpath=//select[@id='toAccountId']/option   10s
    Select From List By Value    ${to_account}     ${FIRST_ACCOUNT}
    Click Button    ${transfer_button}

Transfer fund to other account
    [Documentation]  transfer funds
    [Tags]   UI
    [Arguments]     ${FIRST_ACCOUNT}     ${SECOND_ACCOUNT}    ${VALUE}
    Click Element    ${transfer_funds}
    Input Text    ${amount}    ${VALUE}
    Wait Until Page Contains Element    xpath=//select[@id='fromAccountId']/option   10s
    Select From List By Value    ${from_account}     ${FIRST_ACCOUNT}
    Wait Until Page Contains Element    xpath=//select[@id='toAccountId']/option   10s
    Select From List By Value    ${to_account}     ${SECOND_ACCOUNT}
    Click Button    ${transfer_button}