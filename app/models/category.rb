class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, uniqueness: { case_sensitive: false }, presence: true
end
