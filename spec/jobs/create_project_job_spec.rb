require 'rails_helper'

RSpec.describe CreateProjectJob, :type => :job do
  context 'create proejct' do
    let(:dummy) { Project.create(name: 'hoge') }
    let(:project_dir) { Rails.root.join('spec', 'project', 'hoge', 'hoge') }

    before { CreateProjectJob.perform_now(project: dummy) }
    after do
      FileUtils.rm_rf Rails.root.join('spec', 'project', 'hoge')
      Project.delete_all
    end

    it 'exsit dir' do
      expect(File).to exist(project_dir)
    end

    it 'exist project file' do
      expect(File).to exist(project_dir.join('Gemfile'))
    end
  end
end
