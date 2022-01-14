*** Settings ***
Documentation    A test for tool tips 
Library          Selenium2Library
Resource         widget_resource.robot
Test Setup       Run Keywords      Go To Website 
...              AND    Go To Tooltips Page
Test Teardown    Close Browser

*** Test Cases ***
Tooltip Appears on Button Hover
    Mouseover Hover Button
    Button Tooltip Should Be Visible    buttonToolTip

Tooltip Appears on Textfield Hover
    Mouseover Textfield
    Textfield Tooltip Should Be Visible     textFieldToolTip
    
Tooltip Appears on Text Hover
    Mouseover Text
    Text Tooltip Should Be Visible      contraryTexToolTip