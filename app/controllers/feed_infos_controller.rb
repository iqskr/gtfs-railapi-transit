# frozen_string_literal: true

##
# Feed Infos Controller
class FeedInfosController < ApplicationController
  # GET /feed_info
  def index
    render json: FeedInfo.first
  end
end
