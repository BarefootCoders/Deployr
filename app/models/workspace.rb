class Workspace < ActiveRecord::Base
  attr_accessible :build_id, :path, :status

  belongs_to :build

  after_create :deploy!

  class InvalidVerificationError < StandardError ; end

  def deploy!
    Dir.mktmpdir do |dir|
      with_git(dir) do |git|
        clone_into!(git, dir)
        github = add_remote!(git, "git@github.com:" + build.project.github_repo, "github")
        deploy = add_remote!(git, build.project.deploy_repo, "deploy")
        fetch_and_checkout!(git, github, "master")
        push!(git, deploy, "master")
      end
    end
  end

  def clone_into!(git, directory)
    #verify(git.index.readable?)
  end

  def add_remote!(git, remote, name = "deploy")
    git.add_remote(name, remote)
  end

  def fetch_and_checkout!(git, remote, branch)
    git.fetch(remote)
    git.checkout(branch)
  end

  def push!(git, remote, branch)
    git.push(remote, branch, false)
  end

  private

  def verify(param)
    raise InvalidVerificationError unless param
  end

  def with_git(directory, &block)
    g = Git.init(directory, log: Logger.new(STDOUT))
    block.call(g)
  end
end
