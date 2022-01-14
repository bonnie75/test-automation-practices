*** Settings ***
Library    Selenium2Library
Resource   ../resources/general.robot

*** Variables ***
${browserlink}    browser-windows
${modallink}    modal-dialogs
${browserpage}  https://demoqa.com/${browserlink}
${modalpage}    https://demoqa.com/${modallink}


*** Keywords ***
Click Close Button
    [Arguments]     ${size}
    click button    //button[@id='close${size}Modal']

Click ${button} Button
    click Button    //button[@id='${button}Button']

Click Modal Button
    [Arguments]     ${size}
    click Button    //button[@id='show${size}Modal']

Click X Button
    click element    //span[contains(text(),'×')]

Go To Browser Page  
    Go To   ${browserpage}

Go To Modal Page
    Go To   ${modalpage}

Modal Should Be Visible
    [Arguments]     ${modalsize}
    element should be Visible   //div[@id='example-modal-sizes-title-${modalsize}']

New ${button} Should Be Visible
    switch Window   NEW
    Page Should Contain Element     //h1[@id='sampleHeading']


