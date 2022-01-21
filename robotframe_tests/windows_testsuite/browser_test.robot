*** Settings ***
Documentation    A test suite for browsers and tabs
Library          Selenium2Library
Resource         win_resource.robot
Test Setup       Go To Website
Test Teardown    Close Browser
Test Template    Open New Page

*** Test Cases ***      BUTTON
New Tab                 tab
New Window              window

*** Keywords ***
Open New Page       
    [Arguments]     ${button}
    Go To Browser Page
    Click ${button} Button
    New ${button} Should Be Visible