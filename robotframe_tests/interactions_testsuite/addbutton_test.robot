*** Settings ***
Documentation    A test suite for button interactions
Library          Selenium2Library
Resource         interact_resource.robot
Test Setup       Go To Practice Page
Test Teardown    Close Browser
Test Template    Add Delete Button

*** Test Cases ***      ${count}    
Add One Button              1
Add Multiple Buttons        5

*** Keywords ***
Add Delete Button
    [Arguments]     ${COUNT}
    Repeat Keyword  ${count}   Click Add Element Button
    Multiple Delete Buttons Should Be Visible   ${count}