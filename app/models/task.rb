class Task < ApplicationRecord
    belongs_to :category
    validates :title, uniqueness: true, presence: true

    enum priority: { low: 0, medium: 1, high: 2 }
    enum recurrence: { daily: 0, weekly: 1, monthly: 2 }
end
