*** Settings ***
Documentation   test cases for the login screen
Resource        ./resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Login Screen
Test Teardown   Close Application

*** Test Cases ***
Invalid Login
    Enter Username
    Enter Password
    Click Login Button
    Alert Should Be Visible

Close Alert message
    Enter Username
    Enter Password
    Click Login Button
    Click OK Button
    Alert Should Not Be Visible


*** Keywords ***
Go To Login Screen
    wait until page contains element    accessibility_id=Login Screen   timeout=10 seconds
    click element       accessibility_id=Login Screen

Alert Should Be Visible
    element should contain text     id=android:id/message   Invalid login credentials, please try again

Alert Should Not Be Visible
    Wait until page contains element   accessibility_id=username    timeout=10 seconds
    
Click Login Button
    Click element    //android.view.ViewGroup[@content-desc="loginBtn"]
    wait until page contains element    id=android:id/alertTitle   timeout=10 seconds

Click OK Button
    click element    id=android:id/button1

Enter Username
    Wait until page contains element   accessibility_id=username    timeout=10 seconds
    input text  accessibility_id=username   foo

Enter Password
    input text  accessibility_id=password   bar