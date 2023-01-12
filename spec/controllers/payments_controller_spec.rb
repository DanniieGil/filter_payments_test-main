require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  before :each do
    campaign = FactoryBot.create(:campaign)
    payment = Payment.create(FactoryBot.attributes_for(:payment, campaign_id: campaign.id))
    get :index
  end

  describe 'GET #index' do
    it 'should renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'should redirects to the payments when project_id param is empty' do
      get :index, params: { project_id: '' }
      expect(response).to redirect_to(payments_path)
    end

    # it 'should redirects to the payments when project_id param is invalid' do
    #   get :index, params: { project_id: 'x' }
    #   expect(response).to redirect_to(payments_path)
    # end
  end

  describe 'GET #export' do
    it 'should request for exports payments to CSV or XLSX format' do
      get :export, params: { format: :csv }
      expect(response).to have_http_status(:success)
      get :export, params: { format: :xlsx }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PRIVATE METHOD: invalid_statement' do
    it 'should redirect to root_path when StatementInvalid' do
      allow(Payment).to receive(:order).and_raise(ActiveRecord::StatementInvalid)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
