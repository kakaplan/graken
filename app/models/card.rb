class Card < ApplicationRecord
    #belongs_to :User #commented to prevent errors from
    #has_many :rentals #objects not existing yet 
    #before_create :require_user

    validates :card_number, presence: true,
                            length: {is: 16},
                            numericality: true

    
    validates :cv, presence: true,
                   length: {within: 3..4},
                   numericality: true


    
    validates :name, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                               message: "only allows first name and last name" },
                               presence: true

end
