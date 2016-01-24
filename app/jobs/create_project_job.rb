class CreateProjectJob < ApplicationJob
  queue_as :default

  def perform(*args)
    args.each do |params|
      make_project_dir(params)
      make_project(params)
    end
  end

  private

  def make_project_dir(user: 'hoge', project:)
    FileUtils.mkdir_p(project_root_dir(user))
  end

  def make_project(template: 'master', user: 'hoge', project:)
    origin_files = project_root_dir('template', template)
    FileUtils.cp_r(origin_files, project_root_dir(user, project.name))
  end

  def project_root_dir(*project_dir)
    root = Setting.root
    root.first == 'Rails.root' ? Rails.root.join(*root[1..-1], *project_dir) : root.join('/')
  end
end
