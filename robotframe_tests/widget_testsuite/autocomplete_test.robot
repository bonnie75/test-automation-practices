*** Settings ***
Documentation    A test for opening and closing the accordian
Library          Selenium2Library
Resource         widget_resource.robot
Test Setup       Run Keywords   Go To Website
...              AND    Go To Autocomplete Page
Test Teardown    Close Browser    

*** Test Cases ***
Type Multiple Colour Names
    Click Multiple Colour Field
    FOR     ${colour}   IN  @{COLOR}
        Enter Colour    ${colour}
        Colour Is Listed in Field   ${colour}
    END

Remove One Colour From Multiple List
    Add Multiple Colours To Field
    Click Remove Colour Button
    Colour Is Not Listed in Field   Red

Clear Multiple Colours
    Add Multiple Colours To Field
    Click Clear Field Button
    Multiple Colour Field Should Be Empty

Cannot Enter Non-existing Colour in Multiple Field
    Click Multiple Colour Field
    Enter Colour  Brown
    Multiple Colour Field Should Be Empty

Type Single Colour Name
    Click Single Colour Field
    Enter Single Colour     Blue
    Colour Is Listed in Field  Blue

Cannot Type Multiple Colours In Single Field
    Click Single Colour Field
    Enter Single Colour     Blue
    Enter Single Colour     Red
    Colour Is Not Listed in Field  Blue

Cannot Clear From Single Field
    Click Single Colour Field
    Enter Single Colour  Yellow
    clear element text   //input[@id='autoCompleteSingleInput']    
    Single Colour Field Should Not Be Empty

Cannot Enter Non-existing Colour in Single Field
    Click Single Colour Field
    Enter Single Colour  Brown
    Single Colour Field Should Be Empty