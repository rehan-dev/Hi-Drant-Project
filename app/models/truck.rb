class Truck < ApplicationRecord
  belongs_to :user
  has_many :daytimes
end
