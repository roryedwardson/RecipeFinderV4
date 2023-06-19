*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/RecipeFinderApp.robot

Suite Setup         Begin Web Test
Suite Teardown      End Web Test

#Run tests
#robot -d results tests/RecipeFinder.robot

*** Test Cases ***
Randomly generated ingredient should be returned
    [Documentation]     Generate an ingredient based on txt file pool,
    ...                 to test whether Python ingredient generator is working at first instance.
    [Tags]  Python  001
    RecipeFinderApp.Generate 1 random ingredient

Randomly generated ingredients should be returned
    [Documentation]     Generate three ingredients based on txt file pool,
    ...                 and set them as global variables to be used in next tests.
    [Tags]  Python  002
    RecipeFinderApp.Generate 3 random ingredients

Search for three randomly generated ingredients
    [Documentation]     Perform Google search for recipes based on three randomly selected ingredients.
    [Tags]  Python  Google  003
    RecipeFinderApp.Generate 3 random ingredients
    RecipeFinderApp.Perform search

Return recipe search results as txt file
    [Documentation]     Perform Google search for recipes based on three randomly selected ingredients,
    ...                 and return recipe results as easily readable txt file.
    ...                 Google results have inconsistent xpath, so this does not work 100% of the time.
    [Tags]  Python  Google  004
    RecipeFinderApp.Generate 3 random ingredients
    RecipeFinderApp.Perform search
    RecipeFinderApp.Collate results as txt file