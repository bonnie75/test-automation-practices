*** Settings ***
Documentation    A test suite for submitting a student form
Library          Selenium2Library
Resource         forms_resource.robot
Test Setup       Run Keywords      Go To Website 
...              AND    Go To Practice Page
Test Teardown    Close Browser

*** Test Cases ***
Student Can Enter Valid Values
    Enter Required Fields
    Enter Email
    Enter Birth Date
    Enter Subjects
    Select Hobbies      Sports
    Select State Option
    Select City Option
    Click Submit Button
    Submit Modal Should Be Visible

Student Can Select One Hobby
    Enter Required Fields
    Select Hobbies      Reading
    Click Submit Button
    Selected Hobby Should Be on Modal

Student Can Select Multiple Hobbies
    Enter Required Fields
    Select Hobbies      Sports
    Select Hobbies      Music
    Click Submit Button
    Selected Hobbies Should Be on Modal

Select City Before State
    Enter Required Fields
    Select City Option Should Be Disabled

Gender Is A Required Field
    Enter First Name
    Enter Last Name
    Enter Phone Number      55555512234
    Click Submit Button 
    #Gender Field Should be Red 
    Submit Modal Should Not Be Visible