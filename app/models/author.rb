class Author < ActiveRecord::Base
    has_many :recipes
    has_many :cookbooks, through: :recipes
end