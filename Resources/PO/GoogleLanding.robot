*** Settings ***
Library         SeleniumLibrary
Resource        ../Common.robot

*** Variables ***
${cookies_element} =    //*[@id="L2AGLb"]
${search_element} =     //*[@type="search"]

*** Keywords ***
Navigate to
    go to    https://www.google.com/

Accept cookies
    ${present} =    run keyword and return status    element should be visible    ${cookies_element}
    run keyword if    ${present}    click button    ${cookies_element}

Verify page loaded
    wait until page contains element    ${search_element}

Search
    ${text} =       set variable    ${INGREDIENT1} ${INGREDIENT2} ${INGREDIENT3} recipe
    input text                          ${search_element}   ${text}
    press keys                          ${search_element}   RETURN