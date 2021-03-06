require 'rails_helper'

RSpec.describe Tag, type: :model do

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

end
