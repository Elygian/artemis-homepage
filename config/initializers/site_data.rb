require "date"

module SiteData
  module_function

  DATA_DIR = Rails.root.join("config", "data").freeze
  CACHE = {}

  def load_yaml_file(filename)
    path = DATA_DIR.join(filename)
    YAML.safe_load_file(path, permitted_classes: [Date], aliases: true) || {}
  end

  def load_yaml(filename)
    # In development, read directly from disk so YAML edits appear on refresh.
    return load_yaml_file(filename) if Rails.env.development?

    CACHE[filename] ||= load_yaml_file(filename)
  end

  def about
    load_yaml("about.yml")
  end

  def experience
    load_yaml("experience.yml").fetch("experience", [])
  end

  def projects
    load_yaml("projects.yml").fetch("projects", [])
  end

  def skills
    load_yaml("skills.yml").fetch("skills", [])
  end

  def contact
    load_yaml("contact.yml").fetch("links", [])
  end

  def blog
    load_yaml("blog.yml").fetch("posts", [])
  end
end