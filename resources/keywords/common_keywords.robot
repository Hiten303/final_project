*** Settings ***
Library  SeleniumLibrary
Library   ../../config/env_loader.py

*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***
Load Environment

      Load Env    ${ENV}
      ${url}=  Get Env  baseurl
      ${username}=  Get Env  user_name
      ${pwd}=  Get Env  user_password

     Set Global Variable    ${BASE_URL}  ${url}
     Set Global Variable    ${USER_NAME}  ${username}
     Set Global Variable    ${USER_PWD}  ${pwd}

Open Application
     [Documentation]  Opens the application
     Open Browser  ${BASE_URL}  ${BROWSER}

Close Application
     Close All Browsers