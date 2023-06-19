*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      chrome

*** Keywords ***
Begin Web Test
    set selenium timeout    10s
    open browser            about:blank     ${BROWSER}
    maximize browser window

End Web Test
    close all browsers