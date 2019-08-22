def make_cookbook
    prompt = TTY::Prompt.new
    title = prompt.ask('Enter the title for this cookbook: ')
    this_cookbook = Cookbook.create({
        title: title
    })
    puts "New cookbook created: " + this_cookbook.title
    $current_user.cookbooks << this_cookbook
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

def search_for_recipe
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
        exit
    end
    #print that recipe's contents
    puts "Recipe: " + this_recipe.name
    puts "Ingredients: " + this_recipe.ingredients
    puts "Directions: " + this_recipe.directions
    puts "Cook time: " + this_recipe.cook_time.to_s

end

def view_profile
    puts "Name: " + $current_user.name
    puts "About Me: " + $current_user.about_me 
end



