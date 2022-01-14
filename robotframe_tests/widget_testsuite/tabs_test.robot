*** Settings ***
Documentation    A test for tabs 
Library          Selenium2Library
Resource         widget_resource.robot
Test Setup       Run Keywords      Go To Website 
...              AND    Go To Tabs Page
Test Teardown    Close Browser

*** Test Cases ***
Click What Tab
    Click Tab  what
    element should be visible   //p[contains(text(),'Lorem Ipsum is simply dummy text of the printing a')]

Click Origin Tab
    Click Tab  origin
    element should be visible   //p[contains(text(),'Contrary to popular belief, Lorem Ipsum is not sim')]

Click Use Tab
    Click Tab  use
    element should be visible   //p[contains(text(),'It is a long established fact that a reader will b')]

Click More Tab
    element should be visible      //*[@id='demo-tab-more' and contains(@class, 'disabled')]    