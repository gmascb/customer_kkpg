class Form < ApplicationRecord

    validates :name, :presence => true, uniqueness: true
    belongs_to :tag

end
