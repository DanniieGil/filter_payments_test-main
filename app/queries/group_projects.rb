class GroupProjects
  attr_reader :campaigns

  def call(_params = {})
    scoped = Campaign
    scoped = group_campaigns_for_project(scoped)
  end

  private

  def group_campaigns_for_project(scoped)
    campaigns_by_project_query = scoped.joins(:project)
                                       .select('projects.name, projects.status, projects.id,  COUNT(campaigns.id)')
                                       .group('projects.name, projects.status, projects.id')
  end
end
