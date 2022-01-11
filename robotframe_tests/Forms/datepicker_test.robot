*** Settings ***
Documentation    A test suite for submitting a student form
Library          Selenium2Library
Resource         forms_resource.robot
Test Setup       Go To Website
Test Teardown    Close Browser

*** Test Cases ***
Select And Display Date Of Birth
    Enter Required Fields
    Click Calendar Field
    Date Picker Should Be Visible
    Select Date
    Click Submit Button
    Date Should Be Visible on Modal

Only Date Is Accepted For Date of Birth     #this test will fail because it accepts everything
    [Tags]      fails
    Enter Required Fields
    Clear Element Text  //input[@id='dateOfBirthInput'] 
    Input Text  //input[@id='dateOfBirthInput']     this is not a Date
    Click Submit Button
    Submit Modal Should Not Be Visible