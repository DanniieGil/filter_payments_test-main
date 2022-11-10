# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

projects = 10.times.map do |index|
  Project.create!(name: "Project #{index + 1}", status: Project.statuses.keys.sample)
end

campaigns = projects.flat_map do |project|
  10.times.map do |index|
    Campaign.create!(name: "#{project.name} - Campaign #{index + 1}", project: project)
  end
end

campaigns.each do |campaign|
  20.times.map do |index|
    Payment.new do |payment|
      payment.campaign = campaign
      payment.received_on = (30 - index).day.ago
      payment.capital = [0, 1000, 2000, 3000].sample
      payment.interest = [100, 200, 300].sample
      payment.taxes = payment.interest * 0.16
      payment.withheld_taxes = [0, payment.taxes].sample
      payment.fee = payment.interest * 0.01
      payment.total = payment.capital + payment.interest + payment.taxes - payment.withheld_taxes - payment.fee
      payment.save!
    end
  end
end
