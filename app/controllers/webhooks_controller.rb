class WebhooksController < ApplicationController
  def travis
    Project.find_each(&:fetch_builds!)
  end
end
