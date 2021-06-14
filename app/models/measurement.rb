class Measurement < ApplicationRecord
  validates_presence_of :amount

  belongs_to :user
  belongs_to :course
end
