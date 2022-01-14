*** Settings ***
Documentation    A test suite for opening modals
Library          Selenium2Library
Resource         win_resource.robot
Test Setup       Go To Website
Test Teardown    Close Browser
Test Template    Open Modal Sizes

*** Test Cases ***      ${size}     ${modalsize}
Small Modal             Small       sm
Large Modal             Large       lg

*** Keywords ***
Open Modal Sizes
    [Arguments]     ${SIZE}     ${MODALSIZE}
    Go to Modal Page
    Click Modal Button  ${size}
    Modal Should Be Visible     ${modalsize}