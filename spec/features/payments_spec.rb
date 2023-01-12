require "rails_helper"

RSpec.feature "Payments", type: :feature do


  # scenario "user visits the payments index page" do
  #   visit payments_path(project_id: project.id)

  #   expect(page).to have_content("Payments")
  #   expect(page).to have_selector("table#payments tbody tr", count: payments.count)
  # end

  # scenario "user filters payments by project" do
  #   visit payments_path(project_id: project.id)
  #   select(project.name, from: "project_id")
  #   click_button "Filter"

  #   expect(page).to have_selector("table#payments tbody tr", count: payments.count)
  # end

  # scenario "user exports payments to CSV" do
  #   visit payments_path(project_id: 504)
  #   click_link "Versión .csv"

  #   expect(page.response_headers["Content-Type"]).to eq("text/csv")
  #   expect(page.response_headers["Content-Disposition"]).to eq('attachment; filename=Pagos_Briq.csv')
  # end

  # scenario "user exports payments to XLSX" do
  #   visit payments_path(project_id: project.id)
  #   click_link "Export to XLSX"

  #   expect(page.response_headers["Content-Type"]).to eq("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
  #   expect(page.response_headers["Content-Disposition"]).to eq('attachment; filename=Pagos_Briq.xlsx')
  # end
end