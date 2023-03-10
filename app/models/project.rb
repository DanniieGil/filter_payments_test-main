class Project < ApplicationRecord
  enum :status, {
    0 => 'in_operation',
    1 => 'terminated'
  }

  after_initialize :set_defaults

  private

  def set_defaults
    self.status ||= 0
  end
end
