class PagesController < ApplicationController
  def home
    @about = SiteData.about
    @featured_projects = SiteData.projects.first(3)
  end

  def experience
    @experience = SiteData.experience
  end

  def projects
    @projects = SiteData.projects
  end

  def skills
    @skills = SiteData.skills
  end

  def contact
    @links = SiteData.contact
  end
end