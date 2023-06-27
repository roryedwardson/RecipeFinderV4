import random


def generate_ingredient():
    words = open(r"C:\development\robot-scripts\recipeFinderV4\Resources\CustomLibs\ingredients.txt", "r")
    word_list = []
    for word in words:
        word = word.replace("\n", "")  # remove line breaks
        word_list.append(word)
    ingredient = random.choice(word_list)

    return ingredient
