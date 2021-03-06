require 'rails_helper'

RSpec.describe Form, type: :model do

  context "Associations" do
    it { should belong_to(:tag) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

end
