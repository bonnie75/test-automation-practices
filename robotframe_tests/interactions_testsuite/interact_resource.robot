*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}         chrome
${interactlink}    add_remove_elements/
${dynamiclink}     dynamic_controls
${interactpage}    https://the-internet.herokuapp.com/${interactlink}
${dynamicpage}     https://the-internet.herokuapp.com/${dynamiclink}

*** Keywords ***
Go To Practice Page
    Open Browser   ${interactpage}  ${browser}

Go To Dynamic Page
    Open Browser    ${dynamicpage}  ${browser}

Add Delete Button
    [Arguments]     ${COUNT}
    Repeat Keyword  ${count}   Click Add Element Button
    Multiple Delete Buttons Should Be Visible   ${count}

Checkbox Should Be Unchecked
    checkbox should not be selected     //body/div[2]/div[1]/div[1]/form[1]/div[1]/input[1]

Checkbox Should Be Visible
    element should be visible   //input[@id='checkbox']

Checkbox Should Not Be Visible
    element should not be visible   //input[@id='checkbox']

Check The Checkbox
    select checkbox     //input[@id='checkbox']

Click Add Button
    click button    //button[contains(text(),'Add')]
    Wait Until element is visible   //button[contains(text(),'Remove')]     timeout=15 seconds

Click Add Element Button
    click button    //button[contains(text(),'Add Element')]

Click Delete Button
    click button    //button[contains(text(),'Delete')]

Click Disable Button
    click button    //button[contains(text(),'Disable')]
    wait until element is visible   //button[contains(text(), 'Enable')]    timeout=15 seconds

Click Enable Button
    Click button    //button[contains(text(),'Enable')]
    wait until element is visible   //button[contains(text(),'Disable')]    timeout=15 seconds

Click Remove Button
    click button    //button[contains(text(),'Remove')]
    Wait Until element is Visible   //button[contains(text(),'Add')]   timeout=15 seconds

Delete Button Should Not Be Visible
    element should not be visible   //button[contains(text(),'Delete')]

Multiple Delete Buttons Should Be Visible
    [Arguments]     ${count}
    element should be visible   //body/div[2]/div[1]/div[1]/div[1]/button[${count}]

Textfield should Be Disabled
    element should be Disabled  //body/div[2]/div[1]/div[1]/form[2]/input[1]
    
Textfield Should Be enabled
    element should be enabled   //body/div[2]/div[1]/div[1]/form[2]/input[1]

Uncheck The Checkbox
    Unselect checkbox   //input[@id='checkbox']    
