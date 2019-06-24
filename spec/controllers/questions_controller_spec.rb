# require 'spec_helper'
# require 'rails_helper'

# RSpec.describe QuestionsController, type: :controller do
#   describe 'GET index' do
#     let!(:tenant) { create(:tenant) }
#     let!(:user_one) { create(:user) }
#     let!(:user_two) { create(:user) }
#     let!(:question) { create(:question, user_id: user_one.id) }
#     let!(:answer) { create(:answer, question_id: question.id, user_id: user_two.id) }

#     it 'responds' do
#       http_login(tenant)
#       get :index, format: 'json'

#       items = JSON.parse(response.body)

#       expect(response.status).to eq(200)
#       expect(items.count).to eq(1)
#       expect(items[0]['body']).to eq("How to play")
#     end
#   end
# end
