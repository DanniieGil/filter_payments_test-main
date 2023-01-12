FactoryBot.define do
  factory :campaign do
    name { "Campaign 1" }
    project_id { 1 }
    association :project
  end
end