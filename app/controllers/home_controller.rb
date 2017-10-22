class HomeController < ApplicationController
  def index
    @newest_post ||= BlogPost.joins(:account).last
    respond_to do |format|
      format.html
    end
  end
end
