class HomeController < ApplicationController
  def index
	  @topic = Topic.order("created_at DESC").limit(30)
  end
end
