*** Settings ***
Documentation    A test suite for button interactions
Library          Selenium2Library
Resource         interact_resource.robot
Suite Setup       Go To Dynamic Page
Suite Teardown    Close Browser

*** Test Cases ***     
Remove Unchecked Checkbox
    Checkbox Should Be Unchecked
    Click Remove Button
    Page should contain     It's gone! 
    Checkbox should not be visible   

Add Check And Remove
    Click Add Button   
    Checkbox Should Be Visible
    Check The Checkbox
    Click Remove Button
    Page Should Contain     It's gone!
    Checkbox Should Not Be Visible

Add Uncheck And Remove
    Click Add Button
    Checkbox Should Be Visible
    Uncheck The Checkbox
    Click Remove Button
    Page Should Contain     It's gone!
    Checkbox Should Not Be Visible

Enable Text Field
    Click Enable Button
    Textfield should be enabled

Disable Text Field
    Click Disable Button
    Textfield Should Be Disabled