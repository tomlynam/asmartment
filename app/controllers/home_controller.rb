class HomeController < ApplicationController
  def index
  	@posts = Post.all
  end
end



# pagination: .paginate(:page => params[:page], :per_page => 6)