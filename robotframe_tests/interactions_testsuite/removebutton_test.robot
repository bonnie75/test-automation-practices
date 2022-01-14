*** Settings ***
Documentation    A test suite for button interactions
Library          Selenium2Library
Resource         interact_resource.robot
Test Setup       Go To Practice Page
Test Teardown    Close Browser

*** Test Cases ***   
Remove Last Delete Button
    Click Add Element Button
    Click Delete Button
    Delete Button Should Not Be Visible

Remove One Delete Button
    Add Delete Button  5
    Click Delete Button
    Multiple Delete Buttons Should Be Visible   4  