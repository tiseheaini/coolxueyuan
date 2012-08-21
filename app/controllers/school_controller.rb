class SchoolController < ApplicationController
  def index
	  @school = Topic.all
  end
end
