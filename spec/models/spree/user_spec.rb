require 'spec_helper'

describe Spree::User do

  context "shoulda validations" do
    it { should belong_to(:user_group) }
  end

end
