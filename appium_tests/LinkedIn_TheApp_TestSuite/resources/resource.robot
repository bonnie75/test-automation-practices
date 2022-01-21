*** Settings ***
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/TheApp-v1.9.0.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_DEVICE_NAME}        Android Emulator
${ANDROID_APP_PACKAGE}        io.cloudgrey.the_app

*** Keywords ***
Open Android Application
  [Arguments]
  open application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  deviceName=${ANDROID_DEVICE_NAME}

# List Keywords
Go To List Demo
    wait until page contains element    accessibility_id=List Demo  timeout=10 seconds
    click element   accessibility_id=List Demo

Alert Should Be Visible 
    [Arguments]   ${cloud}
    element should contain text   id=android:id/alertTitle    ${cloud}

Alert Should Not Be Visible
    page should not contain element   id=android:id/alertTitle

Click Cloud Name
    [Arguments]     ${cloud}
    ${visible}      Run Keyword AND Return Status 
    ...             element should be visible   accessibility_id=${cloud}
    Run Keyword If  ${visible}  click element   accessibility_id=${cloud}
    ...             ELSE        Run Keywords
    ...                         Swipe    509    1668    550    901  100   
    ...             AND         click element   accessibility_id=${cloud} 
    wait until page contains element    id=android:id/alertTitle   timeout=10 seconds 

Click Close Alert Button
    [Arguments]     ${button}
    click element   id=android:id/button${button}

Click Learn More Button
    click element   id=android:id/button3
    wait until page contains element    id=android:id/title_template    timeout=10 seconds

Click OK Button
    click element   id=android:id/button1
    wait until page does not contain element    id=android:id/alertTitle    timeout=10 seconds

Selection Alert Should Be Visible
    [Arguments]     ${cloud}
    element should contain text     id=android:id/message   Congratulations! You expressed interest in the ${cloud} cloud

# Photo Keywords
Go To Photo Demo
    wait until page contains element    accessibility_id=Photo Demo   timeout=10 seconds
    click element       accessibility_id=Photo Demo

Click Photo
  [Arguments]   ${photo}
    wait until page contains element    //android.view.ViewGroup[${photo}]/android.widget.ImageView
    click element    //android.view.ViewGroup[${photo}]/android.widget.ImageView
    wait until page contains element    id=android:id/alertTitle    timeout=20 seconds

Selected Photo Message Appears
    element should contain text     id=android:id/alertTitle    Selected Photo
