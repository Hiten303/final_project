*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/register_locators.robot
Resource  ../keywords/common_keywords.robot

*** Keywords ***
Register User
     [Documentation]   Register a new user
     [Tags]  UI
     Click Element    ${register_button}
     Input Text    ${first_name}    hiten
     Input Text    ${last_name}    paliwal
     Input Text    ${address}     123 main st
     Input Text    ${city}        delhi
     Input Text    ${state}    rajasthan
     Input Text    ${zip_code}    202030
     Input Text    ${phone}      9876543211
     Input Text    ${ssn}    11111111
     Input Text     ${user}    ${USER_NAME}


     Input Text    ${password}    ${USER_PWD}
     Input Text    ${confirm}    ${USER_PWD}
     Click Element    ${submit_button}

Register user with empty required fields
      [Documentation]  Chech that user is not able to register when required fields are empty
      [Tags]  UI
      Click Element    ${register_button}
      Click Button    ${submit_button}
      Page Should Contain    First name is required.
      Page Should Contain    Last name is required.
      Page Should Contain    Address is required.
      Page Should Contain    City is required.
      Page Should Contain    State is required.
      Page Should Contain    Zip Code is required.
      Page Should Contain    Social Security Number is required.
      Page Should Contain    Username is required.
      Page Should Contain    Password is required.
      Page Should Contain    Password confirmation is required.

Registration - Password and confirm mismatch
       [Documentation]  Check that user is not able to register when password and confirm password don't match
       [Tags]  UI
       Click Element    ${register_button}
       Input Text    ${first_name}    hiten
       Input Text    ${last_name}    paliwal
       Input Text    ${address}     123 main st
       Input Text    ${city}        delhi
       Input Text    ${state}    rajasthan
       Input Text    ${zip_code}    202030
       Input Text    ${phone}      9876543211
       Input Text    ${ssn}    11111111
       Input Text     ${user}    ${USER_NAME}


       Input Text    ${password}    111
       Input Text    ${confirm}    222
       Click Element    ${submit_button}
       Page Should Contain   Passwords did not match.

Log out
        [Documentation]     Logout user
        [Tags]  UI
        Click Button    ${logout_button}