def make_cookbook
    prompt = TTY::Prompt.new
    title = prompt.ask('Enter the title for this cookbook: ')
    this_cookbook = Cookbook.create({
        title: title
    })
end

def make_recipe
    prompt = TTY::Prompt.new
    name = prompt.ask('Enter the name for this recipe: ')
    ingredients = prompt.ask('Enter the ingredients for this recipe: ')
    directions = prompt.ask('Enter the directions for making this recipe: ')
    cooktime = prompt.ask('Enter how long it takes to make this: ')
    this_recipe = Recipe.create({
        name: title,
        ingredients: ingredients,
        directions: directions,
        cooktime: cooktime
    })
end

def search_for_recipe
end



def view_profile
    puts "Name: " + current_user.name
    puts "About Me: " + current_user.about_me 
end

