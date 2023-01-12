require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:valid_attributes) { { status: 0 } }
  let(:invalid_attributes) { { status: nil } }

  it 'Project model is valid with valid attributes' do
    project = Project.new(valid_attributes)
    expect(project).to be_valid
  end

  it "Project model has a default status of 'in_operation'" do
    project = Project.new
    expect(project.status).to eq('0')
  end

  it 'Project model has a list of statuses' do
    expect(Project.statuses).to eq({ 0 => 'in_operation', 1 => 'terminated' })
  end
end
