class Room < ApplicationRecord
    validates :home_type, presence: true
    validates :home_type, presence: true
    validates :room_type, presence: true
    validates :accommodate, presence: true
    validates :bedroom, presence: true
    validates :bathroom, presence: true
   
    
    has_many :images
                        
end
