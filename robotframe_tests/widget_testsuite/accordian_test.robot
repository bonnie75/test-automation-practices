*** Settings ***
Documentation    A test for opening and closing the accordian
Library          Selenium2Library
Resource         widget_resource.robot
Test Setup       Run Keywords      Go To Website 
...              AND    Go To Accordian Page
...              AND    Click Header One
Test Teardown    Close Browser
Test Template    Open and Close Accordian

*** Test Cases ***      HEADER          TEXT
Section One             1               Lorem Ipsum is simply dummy
Section Two             2               Contrary to popular belief
Section Three           3               It is a long established

*** Keywords ***
Open and Close Accordian
    [Arguments]     ${header}   ${text}
    Click Header    ${header}
    Content Should Be Visible   ${text}
    Click Header    ${header} 
    Content Should Not Be Visible   ${header}
