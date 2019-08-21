Author.delete_all
Cookbook.delete_all
Recipe.delete_all

nori_wraps = Recipe.create(:name=>'Nori Wraps')
miso_soup = Recipe.create(:name=>'Miso Soup')

bob = Author.create(:name=>'Bob Jones')
amy = Author.create(:name=>'Amy Violet')

book1 = Cookbook.create(:title=>'Vegan Cookin')
book2 = Cookbook.create(:title=>'Salt Fat Acid Heat')

nori_wraps.author = bob
miso_soup.author = amy

bob.recipes << nori_wraps
amy.recipes << miso_soup

book1.recipes << nori_wraps
book2.recipes << miso_soup