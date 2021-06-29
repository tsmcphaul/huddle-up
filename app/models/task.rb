class Task < ApplicationRecord
    belongs_to :user
    belongs_to :Project

    validates_presence_of :name
end
