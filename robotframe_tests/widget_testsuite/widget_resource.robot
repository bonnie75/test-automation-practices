*** Settings ***
Library    Selenium2Library
Resource    ../resources/general.robot

*** Variables ***
${autocompletelink}    auto-complete
${accordianlink}       accordian
${sliderlink}          slider
${tabslink}            tabs
${tooltiplink}         tool-tips
${autocompletepage}  https://demoqa.com/${autocompletelink}
${accordianpage}     https://demoqa.com/${accordianlink}
${sliderpage}        https://demoqa.com/${sliderlink}
${tabspage}          https://demoqa.com/${tabslink}
${tooltippage}       https://demoqa.com/${tooltiplink}
@{COLOR}=   Blue    Red     Yellow

*** Keywords ***
Add Multiple Colours To Field
    Click Multiple Colour Field
    FOR     ${colour}   IN  @{COLOR}
        Enter Colour    ${colour}
    END

Button Tooltip Should Be Visible
    [Arguments]     ${hover_message}
    Element Attribute Value Should Be     //button[@id='toolTipButton']     aria-describedby     ${hover_message}

Click Clear Field Button
    click element   //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]

Click Header   
    [Arguments]     ${header}
    click element   //div[@id='section${header}Heading']

Click Header One
    click element   //div[@id='section1Heading']

Click Multiple Colour Field
    click element   //div[@id='autoCompleteMultipleContainer']

Click Single Colour Field
    click element   //div[@id='autoCompleteSingleContainer']

Click Remove Colour Button
    click element   //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]

Click Slider To The Left
    Set Slider Value    //input[@id='sliderValue']      0

Click Tab
    [Arguments]     ${tab}
    click link      //a[@id='demo-tab-${tab}']

Colour Is Listed in Field
    [Arguments]     ${colour}
    element should be visible   //div[contains(text(),'${colour}')]

Colour Is Not Listed in Field
    [Arguments]     ${colour}
    element should not be visible       //div[contains(text(),'${colour}')]

Content Should Be Visible
    [Arguments]     ${text}
    Page should contain     ${text}

Content Should Not Be Visible
    [Arguments]     ${header}
    wait until element is not visible    //div[@id='section${header}Content']    timeout=10
    element should not be visible     //div[@id='section${header}Content']  

Enter Colour
    [Arguments]     ${colour}
    Input Text      //input[@id='autoCompleteMultipleInput']    ${colour}
    Press Keys      //input[@id='autoCompleteMultipleInput']    TAB

Enter Single Colour
    [Arguments]     ${colour}
    Input Text      //input[@id='autoCompleteSingleInput']      ${colour}
    Press Keys      //input[@id='autoCompleteSingleInput']      TAB

Go To Autocomplete Page
    Go To   ${autocompletepage}

Go To Accordian Page
    Go To   ${accordianpage}

Go To Slider Page
    Go To   ${sliderpage}

Go To Tabs Page
    Go To   ${tabspage}

Go To Tooltips Page
    Go To   ${tooltippage}

Multiple Colour Field Should Be Empty
    element should contain      //input[@id='autoCompleteMultipleInput']    ${EMPTY}

Mouseover Hover Button
    mouse over    //button[@id='toolTipButton']
    ${hover_message}=   Get Element Attribute    //button[@id='toolTipButton']      aria-describedby

Mouseover Text
    mouse over     //a[contains(text(),'Contrary')]
    ${hover_text}=      Get Element Attribute   //a[contains(text(),'Contrary')]    aria-describedby

Mouseover Textfield
    mouse over   //input[@id='toolTipTextField']
    ${hover_textfield}=     Get Element Attribute   //input[@id='toolTipTextField']     aria-describedby

Single Colour Field Should Not Be Empty
    element should contain      //div[contains(text(),'Yellow')]    Yellow

Single Colour Field Should Be Empty
    Element should contain      //input[@id='autoCompleteSingleInput']      ${EMPTY}

Slider Should Be At Zero
    element should be visible   //div[contains(text(),'0')]

Text Tooltip Should Be Visible
    [Arguments]     ${hover_text}
    Element Attribute Value Should Be       //a[contains(text(),'Contrary')]    aria-describedby    ${hover_text}

Textfield Tooltip Should Be Visible
    [Arguments]     ${hover_text}
    Element Attribute Value Should Be     //input[@id='toolTipTextField']     aria-describedby     ${hover_text}
