class Category < ApplicationRecord
    has_many :bookmarks , dependent: :destroy
    has_many :children_categories, class_name: "Category", foreign_key: "category_id"
    belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "category_id"

    def new_endpoint
        categories = Category.all
        build(categories)
      end
    
    def self.build(categories)
        st = all.map{|t| info ={
        "id" => t.id,
        "name"=> t.name,
        "public" => t.public
        }}
      end

end

