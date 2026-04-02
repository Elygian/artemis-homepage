class BlogController < ApplicationController
  def index
    @posts = SiteData.blog.sort_by { |post| parse_date(post["date"]) }.reverse
  end

  def show
    @post = SiteData.blog.find { |post| post["slug"] == params[:slug] }
    raise ActionController::RoutingError, "Not Found" if @post.nil?
  end

  private

  def parse_date(value)
    Date.parse(value.to_s)
  rescue Date::Error
    Date.new(1970, 1, 1)
  end
end