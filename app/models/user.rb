<<<<<<< Updated upstream
class User < ApplicationRecord
=======
# frozen_string_literal: true

class User < InventoryRecord
>>>>>>> Stashed changes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
end
