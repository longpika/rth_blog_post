class HomeController < ApplicationController
  def index
    @newest_post ||= BlogPost.last
  end
end
