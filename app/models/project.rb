class Project < ApplicationRecord
  enum status: {in_operation: 0, terminated: 1}
end
