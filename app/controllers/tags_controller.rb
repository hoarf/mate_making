class TagsController < ApplicationController

  def index
	@tags = User.tag_counts_on(:skill)
	respond_to do |format|
		format.json { render json: @tags }
	end
  end
end
