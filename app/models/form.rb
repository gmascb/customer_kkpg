class Form < ApplicationRecord

    validates :name, uniqueness: true

end
