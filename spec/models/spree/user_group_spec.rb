require 'spec_helper'

describe Spree::UserGroup do
  let(:user_group) { UserGroup.new }

  context "shoulda validations" do
    it { should have_many(:users) }
  end

  describe "#save" do
    let(:user_group_valid) { UserGroup.new :name => "Wholesaler" }

    context "when is invalid" do
      it { user_group.save.should be_false }
    end

    context "when is valid" do
      it { user_group_valid.save.should be_true }
    end
  end
end
