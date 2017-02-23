require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe "current_user" do
    # fixtures :users
    before(:each) do
      @user = users(:michael)
      remember(@user)
    end

    it "returns right user when session is nil" do
      expect(current_user).to eq(@user)
      expect(is_logged_in?).to be_truthy
    end

    it "returns nil when remember digest is wrong" do
      @user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to be_nil
    end
  end
end
