require 'valid_email'

class Customer < ApplicationRecord

  validates :name, :presence => true, uniqueness: true
  validates :email, :presence => true, :email => true
  belongs_to :form

end
