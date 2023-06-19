*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         DateTime
Library         OperatingSystem
Library         String
Resource        ../Common.robot

*** Variables ***
@{rec_list} =

*** Keywords ***
Verify page loaded
    [Documentation]    Validate results page
    wait until page contains element    //*[@id="rso"]

Generate results list
    [Arguments]     ${INGREDIENT1}  ${INGREDIENT2}  ${INGREDIENT3}
    [Documentation]     Create list, append results
    ${recipe1} =     get text                   //*[@id="rso"]/div[1]/div/div/div[1]/div/a/h3
    ${url1} =        get element attribute      css=#rso > div:nth-child(1) > div > div > div.Z26q7c.UK95Uc.jGGQ5e.VGXe8 > div > a  href

    ${recipe2} =     get text                   //*[@id="rso"]/div[2]/div/div/div[1]/div/a/h3
    ${url2} =        get element attribute      css=#rso > div:nth-child(2) > div > div > div.Z26q7c.UK95Uc.jGGQ5e.VGXe8 > div > a   href

    ${recipe3} =     get text                   //*[@id="rso"]/div[3]/div/div/div[1]/div/a/h3
    ${url3} =        get element attribute      css=#rso > div:nth-child(3) > div > div > div.Z26q7c.UK95Uc.jGGQ5e > div > a        href


    Append to list      ${rec_list}     ${recipe1}
    Append to list      ${rec_list}     ${url1}
    Append to list      ${rec_list}     \n
    Append to list      ${rec_list}     ${recipe2}
    Append to list      ${rec_list}     ${url2}
    Append to list      ${rec_list}     \n
    Append to list      ${rec_list}     ${recipe3}
    Append to list      ${rec_list}     ${url3}

    log              ${rec_list}

Save to txt file
    [Arguments]     ${INGREDIENT1}  ${INGREDIENT2}  ${INGREDIENT3}
    [Documentation]    Append list to txt file, with each item on a new line
    ${timestamp} =  Get Current Date    result_format=%Y%m%d-%H%M
    ${filename} =   Set Variable        recipe-ideas-${timestamp}.txt
    ${title} =      Set Variable        ${INGREDIENT1}, ${INGREDIENT2} & ${INGREDIENT3}: Recipe Ideas
    ${title_tcase} =    convert to title case    ${title}

    append to file    ../RecipeFinderV4/Results/RecipeIdeas/${filename}  ${title_tcase}\n\n\n
    FOR    ${item}      IN      @{rec_list}
        append to file      ../RecipeFinderV4/Results/RecipeIdeas/${filename}   ${item}\n
    END