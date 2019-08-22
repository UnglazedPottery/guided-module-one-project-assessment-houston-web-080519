require_relative '../config/environment.rb'
ActiveRecord::Base.logger = nil


def run
    welcome
    $current_user = login_page
    menu_options
end

def welcome
    x = Artii::Base.new
    puts Rainbow(x.asciify("Welcome   to   CookBookBuilder!")).green
end

def login_page
    prompt = TTY::Prompt.new
    current_user = nil
    while current_user == nil
        puts ""
        choice = prompt.select("Please choose from the menu:", [
            "Sign In",
            "Create Account",
            "Exit"
        ])
        if( choice == "Sign In")
            current_user = User.where({
                name: prompt.ask('What is your name?'),
                password: prompt.ask('What is your password?')
            }).first
            puts ""
        end
        if( choice == "Create Account")
            name = prompt.ask('What is your name?')
            password = prompt.ask('What is your password?')
            about = prompt.ask('Write a description for you profile: ')
            current_user = User.create({
                name: name,
                password: password,
                about_me: about
            })
            puts ""
        end
        if( choice == "Exit")
            exit
        end  
    end
    current_user
end

def menu_options
    while true
        prompt = TTY::Prompt.new
        choice = prompt.select("Select from menu: ", [
            "Make Cookbook",
            "Make Recipe",
            "Search for a Recipe",
            "Browse Everyone's Recipes",
            "See my Cookbooks",
            "View Profile",
            "Exit"
        ])

        if choice == "Make Cookbook"
            make_cookbook
        end

        if choice == "Make Recipe"
            make_recipe
        end

        if choice == "Search for a Recipe"
            search_for_recipe
        end

        if choice == "Browse Everyone's Recipes"
            browse_recipes
        end

        if choice == "See my Cookbooks"
            display_cookbooks
        end

        if choice == "View Profile"
            view_profile
        end

        if choice == "Exit"
            exit
        end
    end
end

