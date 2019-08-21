class Recipe < ActiveRecord::Base
    belongs_to :author
    belongs_to :cookbook

    # def author=(arg)
    #     puts "hello"
    # end
end