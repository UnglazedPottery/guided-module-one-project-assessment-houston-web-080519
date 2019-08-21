class Recipe < ActiveRecord::Base
    belongs_to :cookbook
    has_one :author , through: :cookbook


    # def author=(arg)
    #     puts "hello"
    # end
end