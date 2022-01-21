*** Settings ***
Documentation   test cases for the clipboard
Resource        ./resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Clipboard Demo
Test Teardown   Close Application

*** Test Cases ***
Set Clipboard Text
    Enter Clipboard Text    foo
    Click Set Button
    Input Text Should Be Visible    foo

Set Empty Clipboard
    Enter Clipboard Text    ${EMPTY}
    Click Set Button
    Enter Text Should Be Visible

Refresh Clipboard Text
    Enter Clipboard Text    Test
    Click Set Button
    Click Refresh Button
    Clipboard Should Display Text   Test


*** Keywords ***
Go To Clipboard Demo
    wait until page contains element    accessibility_id=Clipboard Demo     timeout=10 seconds
    click element   accessibility_id=Clipboard Demo

Click Refresh Button
    click element    //android.view.ViewGroup[@content-desc="refreshClipboardText"]

Click Set Button
    click element    //android.view.ViewGroup[@content-desc="setClipboardText"]

Clipboard Should Display Text
    [Arguments]     ${text}
    wait until page contains element    accessibility_id=${text}    timeout=10 seconds
    element should be Visible   accessibility_id=${text}

Enter Clipboard Text
    [Arguments]     ${text}
    wait until page contains    Here's the clipboard text:  timeout=10 seconds
    input text      accessibility_id=messageInput    ${text}

Enter Text Should Be Visible
    element should contain Text     accessibility_id=messageInput   Enter text

Input Text Should Be Visible
    [Arguments]     ${text}
    element should contain text     accessibility_id=messageInput   ${text}