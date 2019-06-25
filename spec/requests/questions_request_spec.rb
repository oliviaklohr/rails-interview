# frozen_string_literal: true

require 'rails_helper'

module QuestionsRequestHelpers
  # rubocop:disable Style/BracesAroundHashParameters
  def send_index_request(token)
    get '/questions', {}, { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', AUTHORIZATION: "Token token=#{token}" }
  end

  def send_index_query_request(title_query, token)
    get "/questions?title=#{title_query}", {}, { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json', AUTHORIZATION: "Token token=#{token}" }
  end
  # rubocop:enable Style/BracesAroundHashParameters
end

RSpec.configure do |c|
  c.include QuestionsRequestHelpers, questions_request: true
end

RSpec.describe QuestionsController, type: :request, questions_request: true do
  describe '.index' do
    let(:response_body) { JSON.parse(response.body) }

    context 'when no questions are found' do
      before { allow(request).to receive(:authenticate).and_return(true) }
      let(:tenant) { create(:tenant) }

      it 'returns a status of 200' do
        send_index_request(tenant.api_key)
        expect(response.code).to eq('200')
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array in the response body' do
        send_index_request(tenant.api_key)
        expect(response_body).to eq([])
      end
    end

    context 'when a question is found' do
      let!(:tenant) { create(:tenant) }
      let!(:user_one) { create(:user) }
      let!(:user_two) { create(:user) }
      let!(:question) { create(:question, user_id: user_one.id) }
      let!(:answer) { create(:answer, question_id: question.id, user_id: user_two.id) }
      let(:question_title) { question.title }

      it 'returns a status of 200' do
        send_index_request(tenant.api_key)
        expect(response.code).to eq('200')
        expect(response).to have_http_status(:ok)
      end

      it 'returns the question, answers, and associated users' do
        send_index_request(tenant.api_key)
        expect(response_body[0]['title']).to eq(question_title)
      end
    end

    context 'query params' do
      context 'title' do
        let!(:tenant) { create(:tenant) }
        let!(:user_one) { create(:user) }
        let!(:user_two) { create(:user) }
        let!(:question) { create(:question, user_id: user_one.id) }
        let!(:answer) { create(:answer, question_id: question.id, user_id: user_two.id) }

        context 'when complete title is provided' do
          let!(:question_title) { question.title }

          it 'gets the questions with the matching title' do
            send_index_query_request(question_title, tenant.api_key)
            expect(response_body[0]['title']).to eq(question_title)
            expect(response.code).to eq('200')
          end
        end

        context 'when a partial title is provided' do
          let!(:question_title) { question.title.chop }

          it 'gets the questions with the matching title' do
            send_index_query_request(question_title, tenant.api_key)
            expect(response_body[0]['title']).to eq(question.title)
            expect(response.code).to eq('200')
          end
        end

        context 'when a bad title is provided' do
          let!(:question_title) { 'a bunch of garbage' }

          it 'gets the questions with the matching title' do
            send_index_query_request(question_title, tenant.api_key)
            expect(response_body).to eq([])
            expect(response.code).to eq('200')
          end
        end
      end
    end
  end
end
