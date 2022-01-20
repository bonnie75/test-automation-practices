*** Settings ***
Documentation   test cases for the web view
Resource        ./resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Web View Demo
Test Teardown   Close Application

*** Test Cases ***
Clear the URL Input
    Click Clear Button
    URL Should Display Default

Enter A Valid URL
    Enter URL
    Click Go Button 
    Alert Should Be Visible


*** Keywords ***
Go To Web View Demo
    wait until page contains element    accessibility_id=Webview Demo   timeout=10 seconds
    click element       accessibility_id=Webview Demo

Alert Should Be Visible
    element should contain text     id=android:id/message       Sorry, you are not allowed to visit that url   

Click Clear Button
    wait until page contains    Please navigate to a webpage    timeout=10 seconds     
    click element   //android.view.ViewGroup[@content-desc="clearBtn"]

Click Go Button
    click element   //android.view.ViewGroup[@content-desc="navigateBtn"]
    wait until page contains element    id=android:id/alertTitle   timeout=10 seconds

Enter URL
    Input Text      accessibility_id=urlInput   http://www.google.com

URL Should Display Default
    element should contain text     accessibility_id=urlInput   https://appiumpro.com