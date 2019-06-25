# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :question do
    title { FFaker::HipsterIpsum.sentence.gsub(/\.$/, '?') }
    user
  end
end
