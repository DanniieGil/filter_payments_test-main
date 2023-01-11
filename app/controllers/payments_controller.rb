class PaymentsController < ApplicationController
  before_action :pagination, only: [:index]
  rescue_from ActiveRecord::StatementInvalid, with: :invalid_statement

  def initialize
    super
    @grouped_options = []
  end

  def index
    filter_by_projects

    return unless params[:project_id].present?

    @payments = FilterPayments.new.call(payments_params_filter).page(params[:page])

    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='payments.xlsx'"
      end
      format.html { render :index }
    end
  end

  private

  def pagination
    @payments = Payment.order(received_on: :desc).preload(:campaign, :project).page(params[:page])
  end

  def filter_by_projects
    redirect_to payments_path if params[:project_id] == ''

    Project.statuses.each do |status|
      @grouped_options << [t("activerecord.attributes.project.status.#{status[1]}"),
                           built_optgroup_options_html(status[0])]
    end
  end

  def built_optgroup_options_html(status)
    GroupProjects.new.call.select do |project|
      project.status == status
    end.sort.map { |x| ["- #{x.name} (#{x.count})", x.id] }
  end

  def payments_params_filter
    params.permit(:project_id, :page)
  end

  def invalid_statement
    redirect_to root_path
  end
end
