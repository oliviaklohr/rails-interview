require 'spec_helper'
require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET index' do
    let!(:tenant) { create(:tenant) }

    it 'responds successfully' do
      http_login(tenant)
      get :index
      assert_response :success
    end
  end
end
