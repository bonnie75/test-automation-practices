*** Settings ***
Documentation    A test suite for creating new computer
Library          Selenium2Library
Resource         table_resource.robot
Test Setup       Go To Table Page
Test Teardown    Close Browser

*** Test Cases ***
Create New Computer Entry
    Click Add New Computer Button
    Computer Form Should Be Visible
    Enter Computer Name
    Enter Introduced Date 
    Enter Discontinued Date
    Enter Company 
    Click Create This Computer Button
    Page Should Contain     Computer IBM has been created

Computer Name Field Cannot Be Empty
    Click Add New Computer Button
    Click Create This Computer Button
    Computer Name Should Display Error

Cancel Computer Entry Form
    Click Add New Computer Button
    Enter Computer Name
    Click Cancel Button
    Alert Message Should Not Display

Edit Computer Entry Form
    Click Computer Name From List
    Computer Name Should Be Visible

Delete Computer Entry
    Click Computer Name From List
    Click Delete This Computer Button
    Page Should Contain     Computer ASCI Blue Mountain has been deleted
