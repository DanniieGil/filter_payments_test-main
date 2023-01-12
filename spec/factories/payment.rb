FactoryBot.define do
  factory :payment do
    received_on { 1.day.ago }
    capital { 1000 }
    interest { 100 }
    taxes { 16 }
    withheld_taxes { 16 }
    fee { 2 }
    total { 1000 + 100 + 16 - 16 - 2 }
    association :project, factory: :campaign
  end
end
