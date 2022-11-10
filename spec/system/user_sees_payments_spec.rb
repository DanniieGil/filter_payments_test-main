require "system_helper"

RSpec.describe "User sees payments" do
  include ActionView::Helpers::NumberHelper

  scenario "successfully" do
    project = create :project
    campaign = create :campaign, project: project
    payment = create :payment, campaign: campaign

    visit root_path

    within "#payment_#{payment.id}" do
      expect(page).to have_text payment.received_on
      expect(page).to have_text payment.project.name
      expect(page).to have_text payment.campaign.name
      expect(page).to have_text number_to_currency payment.capital
      expect(page).to have_text number_to_currency payment.interest
      expect(page).to have_text number_to_currency payment.taxes
      expect(page).to have_text number_to_currency payment.withheld_taxes
      expect(page).to have_text number_to_currency payment.fee
      expect(page).to have_text number_to_currency payment.total
    end
  end
end