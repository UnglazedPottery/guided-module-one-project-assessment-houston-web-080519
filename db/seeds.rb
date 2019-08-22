User.delete_all
Cookbook.delete_all
Recipe.delete_all

bob = User.create(:name=>'Bob Jones', :password=>'bob', :about_me=>'Inventor of Awesome Sauce and known for my nori wraps.')
amy = User.create(:name=>'Amy Violet', :password=>'amy', :about_me=>'Have a cooking show on Netflix based on my book.')
jo = User.create(:name=>'Jo T', :password=>'jo', :about_me=>'I use the traditional recipes passed down hundreds of years from my family.')

nori_wraps = Recipe.create(
    :name=>'Nori Wraps',
    :ingredients=>'nori, avocado, cucumber, carrot, tofu, lime, salt, rice',
    :directions=>'1) Slice avocado, cucumber, carrot, and tofu into strips. 2) Season rice with lime and salt. 3) Spread rice over a sheet of nori and add one strips of tofu and veggies. Roll it together then ready to eat.',
    :cook_time=>'20 min')
miso_soup = Recipe.create(
    :name=>'Miso Soup',
    :ingredients=>'miso paste, soy sauce, shitake mushrooms, enoki mushrooms, bok choy, green onion, garlic, thai pepper',
    :directions=>'1) Finely chop garlic, green onion, and thai pepper and add to pot. 2) Add mushrooms and bok choy to pot with soy sauce. Bring to boil and then lower to simmer for 10 min. 3) Turn off heat and mix in miso paste. Soup is ready. Serve with rice.',
    :cook_time=>'20 min')
wontons = Recipe.create(
    :name=>'Wontons',
    :ingredients=>'ground pork, ginger, green onion, garlic, wonton wraps',
    :directions=>'1) Finely chop garlic, green onion, and ginger. 2) Add that to a pan with ground pork and salt. Cook on high heat, stirring frequently. 3) Remove cooked pork from pan and place in a bowl to cool down some. 4) Seperate wonton wraps. Spoon some of that pork filling just made into a wrap and fold over and pinch the corners to seal the filling. 5) Steam these for 10 min.',
    :cook_time=>'30 min')

book1 = Cookbook.create(:title=>'Vegan Cookin')
book2 = Cookbook.create(:title=>'Salt Fat Acid Heat')
book3 = Cookbook.create(:title=>'Easy Chinese Food')

bob.recipes << nori_wraps
amy.recipes << miso_soup

bob.cookbooks << book1
amy.cookbooks << book2

wontons.user = jo
book3.user = jo
book3.recipes << wontons

