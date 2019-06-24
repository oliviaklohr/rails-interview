# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }
  subject { create(:question, user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
