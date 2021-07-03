class Project < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks

    validates_presence_of :name
    validates_uniqueness_of :name
end