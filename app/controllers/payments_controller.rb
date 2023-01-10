class PaymentsController < ApplicationController
  before_action :pagination, only: [:index]

  def initialize
    super
    @grouped_options = []
  end

  def index
    Project.statuses.each do |key, value|
      @grouped_options.push([t("activerecord.attributes.project.status.#{key}"), [value]])
    end

    return unless params[:project_id].present?

    @payments = FilterPayments.new.call(payments_params_filter).page(params[:page])
  end

  private

  def pagination
    @payments = Payment.order(received_on: :desc).preload(:campaign, :project).page(params[:page])
  end

  def payments_params_filter
    params.permit(:project_id, :page)
  end
end
