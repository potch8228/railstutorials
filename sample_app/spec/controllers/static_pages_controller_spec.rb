require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  # 本来ならこのspecでHTMLのレンダリングをテストする予定はない。
  # きちんとfeature/viewとしてテストするべき
  # ↓のrender_viewsを入れることでassert_selectで値を補足できる
  render_views
  describe "Static pages" do
    before(:each) do
      @base_title = "Ruby on Rails Tutorial Sample App"
    end

    it "should get home" do
      get :home
      expect(response).to have_http_status :success
      assert_select "title", "#{@base_title}"
    end

    it "should get help" do
      get :help
      expect(response).to have_http_status :success
      assert_select "title", "Help | #{@base_title}"
    end

    it "should get about" do
      get :about
      expect(response).to have_http_status :success
      assert_select "title", "About | #{@base_title}"
    end

    it "should get contact" do
      get :contact
      expect(response).to have_http_status :success
      assert_select "title", "Contact | #{@base_title}"
    end
  end
end
