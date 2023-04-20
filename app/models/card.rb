class Card < ApplicationRecord
    #belongs_to :User #commented to prevent errors from
    #has_many :rentals #objects not existing yet 
    #before_create :require_user

    validates :card_number, presence: true,
                            length: {is: 16},
                            numericality: true

    
    validates :cv, presence: true,
                   length: {within: 3..4, 
                            message: "is too short and should not start with 0"}


    
    validates :name, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                               message: "only allows first name and last name" },
                               presence: true

    has_many :rental_history, class_name: :Rental, primary_key: :id, foreign_key: :card_id 
    belongs_to :user, class_name: :User, primary_key: :id, foreign_key: :user_id
end
