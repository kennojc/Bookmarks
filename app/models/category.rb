class Category < ApplicationRecord
    has_many :bookmarks , dependent: :destroy
    has_many :children_categories, class_name: "Category", foreign_key: "category_id"
    belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "category_id"
end

