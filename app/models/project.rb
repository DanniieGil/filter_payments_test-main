class Project < ApplicationRecord
  enum :status, {
    0 => "in_operation",
    1 => "terminated"
  }
end
