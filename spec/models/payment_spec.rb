require 'rails_helper'

RSpec.describe Payment, type: :model do
  campaign = FactoryBot.create(:campaign)
  payment = Payment.create(FactoryBot.attributes_for(:payment, campaign_id: campaign.id))

  it 'Payment model should have a campaign in reference' do
    expect(payment.campaign_id).to eq(campaign.id)
  end

  it 'Payment model should have one project through campaign' do
    expect(payment).to respond_to(:project)
  end
end
