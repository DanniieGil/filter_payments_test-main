class Payment < ApplicationRecord
  belongs_to :campaign
  has_one :project, through: :campaign
end
