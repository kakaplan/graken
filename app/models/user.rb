class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #has_many :cards

  has_many :rental_history, class_name: :Rental, primary_key: :id, foreign_key: :user_id 
  has_one :current_card, class_name: :Card, primary_key: :id, foreign_key: :user_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  def has_card?
    Card.find_by(user_id: id).present?
  end
end
