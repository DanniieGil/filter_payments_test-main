require 'rails_helper'

RSpec.describe Campaign, type: :model do
  campaign = FactoryBot.create(:campaign)

  it 'Campaign model should have a project in reference' do
    expect(campaign).to respond_to(:project)
  end
end
