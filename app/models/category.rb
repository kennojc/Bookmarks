class Category < ApplicationRecord
    has_many :bookmarks
    has_many :child_categories, class_name: "Category", foreign_key: "category_id"
    belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "category_id"
end
