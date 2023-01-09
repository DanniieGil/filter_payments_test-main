class Payment < ApplicationRecord
  belongs_to :campaign
  has_one :project, through: :campaign

  paginates_per 5
end
