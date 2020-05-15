class Form < ApplicationRecord

    validates :name, uniqueness: true
    belongs_to :tag

end
