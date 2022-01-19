class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, uniqueness: true, presence: true
end
