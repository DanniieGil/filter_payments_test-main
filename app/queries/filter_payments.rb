class FilterPayments
  attr_reader :payments

  def initialize(payments = initial_scope)
    @payments = payments
  end

  def call(params = {})
    scoped = payments
    scoped = filter_by_project_id(scoped, params[:project_id])
  end

  private

  def initial_scope
    Payment.all
  end

  def filter_by_project_id(scoped, project_id)
    return scoped unless project_id.present?

    scoped.includes(:campaign).where(
      'campaigns.project_id = :project_id',
      project_id: project_id
    ).references(:campaigns)
  end
end
