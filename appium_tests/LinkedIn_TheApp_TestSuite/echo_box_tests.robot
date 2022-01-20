*** Settings ***
Documentation   test cases for the echo box
Resource        ./resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Echo Box
Test Teardown   Close Application

*** Test Cases ***
Echo Box Returns Same Text Entered
    Enter Text      Hello Jello
    Tap Save Button
    Text Should Be Visible  Hello Jello

Echo Box Should Not Return Empty Field
    Enter Text      ${EMPTY}
    Tap Save Button
    Message Should Not Be Visible  

*** Keywords ***
Go To Echo Box
    wait until page contains element    //android.view.ViewGroup[@content-desc="Echo Box"]    timeout=10 seconds
    click element   //android.view.ViewGroup[@content-desc="Echo Box"]

Enter Text 
    [Arguments]     ${text}
    wait until page contains element    //android.view.ViewGroup[@content-desc="messageSaveBtn"]    timeout=10 seconds
    Input text      accessibility_id=messageInput    ${text}

Message Should Not Be Visible
    Page Should Not Contain Text   Here's what you said before:

Tap Save Button
    click element   //android.view.ViewGroup[@content-desc="messageSaveBtn"]

Text Should Be Visible
    [Arguments]     ${text}
    wait until page contains element   //android.widget.TextView[@content-desc="${text}"]   timeout=10 seconds