
def list_cookbooks(question)
    prompt = TTY::Prompt.new
    myCookbooks = $current_user.cookbooks.map do |c|
        c.name
    end
    myCookbooks << "Exit"
    choice = prompt.select(question, myCookBooks)

        
    return choice
end



# def view_recipe
    
# end

# def list_recipes_in_book
#     recipes_array = first.recipes.map do |r|
#         r.name
#     end

#     chosen_recipe = prompt.select("Choose a recipe to look at: ", recipes_array)
#     chosen_recipe
# end

# def display_cookbooks
#     question = "Choose a cookbook to view it's recipes: "
#     choice = list_cookbooks(question)

#     if(choice == first.title)
#         list_recipes_in_book
#         puts chosen_recipe
#         binding.pry
#         if(chosen_recipe == false)

#         end
#     end
#     if(choice == second.title)
        
#     end
#     if(choice == third.title)
        
#     end
#     if(choice == fourth.title)
        
#     end
#     if(choice == "Exit")
#         exit
#     end
#     # list_recipes_in_book(choice)
#     # view_recipe
# end

# def make_recipe
#     prompt = TTY::Prompt.new
#     name = prompt.ask('Enter the name for this recipe: ')
#     ingredients = prompt.ask('Enter the ingredients for this recipe: ')
#     directions = prompt.ask('Enter the directions for making this recipe: ')
#     cooktime = prompt.ask('Enter how long it takes to make this: ')
#     this_recipe = Recipe.create({
#         name: title,
#         ingredients: ingredients,
#         directions: directions,
#         cooktime: cooktime
#     })

#     question = "Choose a cookbook to add recipe to."
#     list_cookbooks(question)
#     if(choice == first.title)
#         first.recipes.push(this_recipe)
#     end
#     if(choice == second.title)
#         second.recipes.push(this_recipe)
#     end
#     if(choice == third.title)
#         third.recipes.push(this_recipe)
#     end
#     if(choice == fourth.title)
#         fourth.recipes.push(this_recipe)
#     end
#     if(choice == "Exit")
#         exit
#     end
# end

