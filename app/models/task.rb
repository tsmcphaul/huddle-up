class Task < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates_presence_of :name

    # scope :completed, -> { where(finished: true)}
    scope :unfinished, -> { where(finished: false)}

    
end
