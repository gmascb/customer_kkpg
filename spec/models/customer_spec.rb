require 'rails_helper'

RSpec.describe Customer, type: :model do

  context "Associations" do
    it { should belong_to(:form) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context "Email Rules" do
    it "must have a valid e-mail, otherwise return validation false" do
      customer = Customer.new(name: "foo", email: "bar", form: Form.new)
      expect(customer.valid?).to be_falsey
    end

    it "must have a valid e-mail, so it's valid" do
      customer = Customer.new(name: "foo", email: "bar@mail.com", form: Form.new)
      expect(customer.valid?).to be_truthy
    end
  end


end
