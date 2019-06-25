# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :tenant do
    name { FFaker::HipsterIpsum.sentence }
    api_key { SecureRandom.hex(16) }
  end
end
