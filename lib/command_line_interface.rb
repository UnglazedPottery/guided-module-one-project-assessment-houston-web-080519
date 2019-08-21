require_relative '../config/environment.rb'
ActiveRecord::Base.logger = nil


def run
    welcome
    login_page
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
        choice = prompt.select("Please choose from the menu:", [
            "Sign In",
            "Create Account",
            "Exit"
        ])
        if( choice == "Sign In")
            current_user = Author.where({
                name: prompt.ask('What is your name?'),
                password: prompt.ask('What is your password?')
            }).first
        end
        if( choice == "Create Account")
            name = prompt.ask('What is your name?')
            password = prompt.ask('What is your password?')
            current_user = Author.create({
                name: name,
                password: password
            })
        end
        if( choice == "Exit")
            exit
        end  
    end
    current_user
end

# def menu_options
#     while true
#         choice = prompt.select("Enter number from menu: ", [
#             "1) Make Cookbook",
#             "2) Make Recipe",
#             "3) Search for Recipe",
#             "4) See my Cookbooks",
#             "5) View Profile",
#             "6) Exit"
#         ])

#         if choice == 1
#             make_cookbook
#         end

#         if choice == 2
#             make_recipe
#         end

#         if choice == 3
#             search_for_recipe
#         end

#         if choice == 4
#             display_cookbooks
#         end

#         if choice == 5
#             view_profile
#         end

#         if choice == 6
#             break 
#         end
#     end
# end

