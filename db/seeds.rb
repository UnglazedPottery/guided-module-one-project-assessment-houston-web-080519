User.delete_all
Cookbook.delete_all
Recipe.delete_all

bob = User.create(:name=>'Bob Jones', :password=>'bob', :about_me=>'Inventor of Awesome Sauce and known for my nori wraps.')
amy = User.create(:name=>'Amy Violet', :password=>'amy', :about_me=>'Have a cooking show on Netflix based on my book.')
jo = User.create(:name=>'Jo T', :password=>'jo', :about_me=>'I use the traditional recipes passed down hundreds of years from my family.')

nori_wraps = Recipe.create(:name=>'Nori Wraps')
miso_soup = Recipe.create(:name=>'Miso Soup')
wontons = Recipe.create(:name=>'Wontons')

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

