
def display_cookbooks
    prompt = TTY::Prompt.new
    myCookbooks = {}
    $current_user.cookbooks.each do |c|
        myCookbooks[c.title] = c
    end
    myCookbooks << "Exit"
    this_cookbook = prompt.select("Choose a cookbook to view it's recipes.", myCookbooks)  

    myRecipes = {}
    $current_user.recipes.each do |r|
        myRecipes[r.name] = r
    end
    myRecipes << "Exit"
    this_recipe = prompt.select("Choose a recipe to look at.", myRecipes)
    #print that recipe's contents
    puts "Recipe: " + this_recipe.name
    puts "Ingredients: " + this_recipe.ingredients
    puts "Directions: " + this_recipe.directions
    puts "Cook time: " + this_recipe.cook_time

    # if(choice == first.title)
    #     list_recipes_in_book
    #     puts chosen_recipe
    #     if(chosen_recipe == false)

    #     end
    # end
    # if(choice == second.title)
        
    # end
    # if(choice == third.title)
        
    # end
    # if(choice == fourth.title)
        
    # end
    # if(choice == "Exit")
    #     exit
    # end
end



def make_recipe
    prompt = TTY::Prompt.new
    name = prompt.ask('Enter the name for this recipe: ')
    ingredients = prompt.ask('Enter the ingredients for this recipe: ')
    directions = prompt.ask('Enter the directions for making this recipe: ')
    cooktime = prompt.ask('Enter how long it takes to make this: ')
    this_recipe = Recipe.create({
        name: name,
        ingredients: ingredients,
        directions: directions,
        cook_time: cooktime
    })
 
    myCookbooks = {}
    $current_user.cookbooks.each do |c|
        myCookbooks[c.title] = c
    end
    myCookbooks.merge!(exit: "Exit")
    # myCookbooks << "Exit"
    choice = prompt.select("Choose a cookbook to add recipe to.", myCookbooks)  
    
    if(choice == "Exit")
        exit
    end
    choice.recipes << this_recipe

end

