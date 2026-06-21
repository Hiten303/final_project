*** Settings ***
Library   SeleniumLibrary
Resource   ../../variables/register_locators.robot
Resource    login_page.robot

*** Keywords ***
Register user with arguments
       [Documentation]    Register user using arguments from the calling function
       [Tags]    UI
       [Arguments]    ${first}    ${last}    ${add}    ${cit}    ${stat}    ${zip}    ${phno}    ${ss}    ${use}    ${pass}
       Do Login    ${use}   ${pass}
       ${login_failed}=   Run Keyword And Return Status
       ...   Wait Until Page Contains
       ...   The username and password could not be verified.
       ...   3s

       IF    ${login_failed}
            Wait Until Element Is Visible    ${register_button}
            Click Element    ${register_button}
            Input Text    ${first_name}    ${first}
            Input Text    ${last_name}    ${last}
            Input Text    ${address}     ${add}
            Input Text    ${city}        ${cit}
            Input Text    ${state}    ${stat}
            Input Text    ${zip_code}    ${zip}
            Input Text    ${phone}      ${phno}
            Input Text    ${ssn}     ${ss}
            Input Text     ${user}    ${use}


            Input Text    ${password}    ${pass}
            Input Text    ${confirm}    ${pass}
            Click Element    ${submit_button}


       END



Do Login
      [Arguments]    ${USE}    ${PASS}
      Wait Until Element Is Enabled    ${login_username}
      Wait Until Element Is Visible    ${login_username}
      Input Text    ${login_username}    ${USE}
      Input Text    ${login_password}    ${PASS}
      Click Element    ${log_in_button}