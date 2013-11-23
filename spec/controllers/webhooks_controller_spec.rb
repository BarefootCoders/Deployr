require 'spec_helper'

describe WebhooksController do

  describe "GET 'travis'" do
    it "returns http success" do
      get 'travis'
      response.should be_success
    end
  end

end
