class Tenant < ActiveRecord::Base
  before_create :generate_api_key

  has_many :visits, class_name: 'Ahoy::Visit'
  has_many :events, class_name: 'Ahoy::Event'

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
