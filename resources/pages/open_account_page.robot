*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/open_account_locators.robot
*** Keywords ***
Open Checking Account
    [Documentation]  open checking
    [Tags]  UI
    Wait Until Page Contains Element    ${open_new_account}    20s
    Wait Until Element Is Visible       ${open_new_account}    20s
    Wait Until Element Is Enabled       ${open_new_account}    20s
    Scroll Element Into View            ${open_new_account}
    Click Element    ${open_new_account}
    Wait Until Element Is Enabled    ${account_type}
    Select From List By Index    ${account_type}   0
    Wait Until Page Contains Element    xpath=//select[@id='fromAccountId']/option   10s
    Select From List By Index     ${account_number}  0
    Wait Until Element Is Enabled    ${open_account_button}
    Click Button    ${open_account_button}
    Wait Until Element Is Visible    ${new_accoount_id}
    ${ACCOUNT_ID}=  Get Text    ${new_accoount_id}
    RETURN   ${ACCOUNT_ID}

Open Savings Account
    [Documentation]  open savings account
    [Tags]  UI
    Wait Until Page Contains Element    ${open_new_account}    20s
    Wait Until Element Is Visible       ${open_new_account}    20s
    Wait Until Element Is Enabled       ${open_new_account}    20s
    Scroll Element Into View            ${open_new_account}
    Click Element    ${open_new_account}
    Wait Until Element Is Visible    ${account_type}
    Select From List By Index    ${account_type}   1
    Wait Until Page Contains Element    xpath=//select[@id='fromAccountId']/option   10s
    Select From List By Index    ${account_number}  0
    Wait Until Element Is Enabled    ${open_account_button}
    Click Button    ${open_account_button}
    Wait Until Element Is Visible    ${new_accoount_id}
    ${ACCOUNT_ID}=  Get Text    ${new_accoount_id}
    RETURN   ${ACCOUNT_ID}