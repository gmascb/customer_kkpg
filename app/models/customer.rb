require 'valid_email'

class Customer < ApplicationRecord

  validates :name, :presence => true
  validates :email, :presence => true, :email => true, uniqueness: true
  belongs_to :form

end
