def make_cookbook
    prompt = TTY::Prompt.new
    title = prompt.ask('Enter the title for this cookbook: ')
    this_cookbook = Cookbook.create({
        title: title
    })
    puts "New cookbook created: " + this_cookbook.title
    $current_user.cookbooks << this_cookbook
    puts ""
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
    choice = prompt.select("Choose a cookbook to add recipe to:", myCookbooks)  
    
    if(choice == "Exit")
        menu_options
    end
    choice.recipes << this_recipe
    puts this_recipe.name + " added to " + choice.title
    puts ""
end

def browse_recipes
    prompt = TTY::Prompt.new
    allRecipes = {}
    Recipe.all.each do |r|
        allRecipes[r.name] = r
    end
    allRecipes.merge!(exit: "Exit")
    this_recipe = prompt.select("Choose a recipe to look at:", allRecipes)
    puts ""
    if(this_recipe == "Exit")
        menu_options
    end
    puts "Recipe: " + this_recipe.name
    puts "Ingredients: " + this_recipe.ingredients
    puts "Directions: " + this_recipe.directions
    puts "Cook time: " + this_recipe.cook_time.to_s
    puts ""
end

def display_cookbooks
    prompt = TTY::Prompt.new
    myCookbooks = {}
    $current_user.cookbooks.each do |c|
        myCookbooks[c.title] = c
    end
    myCookbooks.merge!(exit: "Exit")
    this_cookbook = prompt.select("Choose a cookbook to view it's recipes.", myCookbooks)  

    myRecipes = {}
    this_cookbook.recipes.each do |r|
        myRecipes[r.name] = r
    end
    myRecipes.merge!(exit: "Exit")
    this_recipe = prompt.select("Choose a recipe to look at.", myRecipes)
    if(this_recipe == "Exit")
        menu_options
    end
    #print that recipe's contents
    puts ""
    puts "Recipe: " + this_recipe.name
    puts "Ingredients: " + this_recipe.ingredients
    puts "Directions: " + this_recipe.directions
    puts "Cook time: " + this_recipe.cook_time.to_s
    puts ""

    # prompt = TTY::Prompt.new
    delete = prompt.select("Would you like to delete this recipe?", ["Yes", "No"])
    if(delete == "Yes")
        puts this_recipe.name + " is deleted. New changes will be updated after exiting the program."
        this_recipe.destroy
        puts ""
    end
    if(delete == "No")
        menu_options
    end

end

def view_profile
    puts "Name: " + $current_user.name
    puts "About Me: " + $current_user.about_me
    puts ""

    prompt = TTY::Prompt.new
    choice = prompt.select("Would you like to edit your profile?", ["Yes", "No"])

    if(choice == "Yes") 
        name = prompt.ask('Enter your new profile name: ')
        aboutme = prompt.ask('Enter a new about_me: ')
        $current_user.update({
            name: name,
            about_me: aboutme
        })
        puts "edit complete"
        puts ""
    end

    if(choice == "No")
        menu_options
    end
end

def search_for_recipe
    prompt = TTY::Prompt.new
    name = prompt.ask('Enter the name of the recipe you want to search for: ')
    x = Recipe.all.find do |r|
        r.name == name
    end
    puts ""
    puts "Recipe: " + x.name
    puts "Ingredients: " + x.ingredients
    puts "Directions: " + x.directions
    puts "Cook time: " + x.cook_time
    puts ""
end


