# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :answer do
    body { FFaker::HipsterIpsum.sentence }
    user
    question
  end
end
