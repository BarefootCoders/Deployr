require 'travis/pro'
module Travis
  class BuildDeployLinker

    class NotDeployableError < StandardError ; end

    DEPLOY_AUTHORIZATIONS = {
      :production => :master,
      :staging => :develop
    }

    attr_accessor :github_path, :project

    def intialize(github_path)

    end

    class << self
      def configure(access_token)
        @access_token = access_token
      end

      def access_token
        @access_token
      end
    end

    def builds
      project.recent_builds
    end

    def branches
      [:master, :develop]
    end

    def deployable?(environment, branch)
      DEPLOY_AUTHORIZATIONS[environment.to_sym] == branch.to_sym && project.branch(branch).green?
    end

    def deploy_to!(environment, branch)
      raise NotDeployableError unless deployable?(environment, branch)
      begin
        Workspace.create!(project, branch)
      rescue
        binding.pry
      end
    end

    private

    def project
      @project ||= client.repo(@github_path)
    end

    def client
      @client ||= Travis::Client.new(access_token: Travis::BuildDeployLinker.access_token)
    end
  end
end
