# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { create(:question) }
  let(:user) { create(:user) }
  subject { create(:answer, question_id: question.id, user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
