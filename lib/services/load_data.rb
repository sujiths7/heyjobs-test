class LoadData
  include Callable

  def call
    jobs = [{title: 'Senior Software Engineer', description: 'Senior software engineer in RoR with 5 years of experience'}, {title: 'Team lead', description: 'Team lead engineer in RoR with 7 years of experience'}]
    @jobs = Job.create(jobs)
    @jobs.first.campaigns.create([{status: 'active', external_reference: '2', ad_description: 'Senior software engineer with 5 year exp'}, {status: 'paused', external_reference: '1', ad_description: 'Senior software engineer with 5 year exp'}])
    @jobs.last.campaigns.create([{status: 'deleted', external_reference: '3', ad_description: 'team lead engineer with 8 year exp'}])
  end
end
