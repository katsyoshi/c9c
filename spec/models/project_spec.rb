require 'rails_helper'

RSpec.describe Project, :type => :model do
  describe 'Create Project' do
    let(:project) { Project.create(name: 'foo') }
    before { project }
    after { Project.destroy(project.id) }
  end
end
