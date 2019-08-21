def make_cookbook
    prompt = TTY::Prompt.new
    title = prompt.ask('Enter the title for this cookbook: ')
    this_cookbook = Cookbook.create({
        title: title
    })
    puts "New cookbook created: " + this_cookbook.title
    $current_user.cookbooks << this_cookbook
end


def search_for_recipe
end


def view_profile
    puts "Name: " + current_user.name
    puts "About Me: " + current_user.about_me 
end

