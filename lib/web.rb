require 'sinatra'
require_relative 'docker_api'
require_relative 'shields'
require 'pry'

DEFAULT_SUBJECT = 'docker automated build'
DEFAULT_STYLE = 'default'
PROJECT_SITE = 'https://github.com/jirutka/maven-badges'

configure :production do
  disable :static
  before {cache_control :public, :max_age => 3600}
end

#Returns badge image with the repository last build status
get %r{/docker-hub/(.+)} do
  url = params[:captures]
  req = url[0].split('/')
  repository = req[0] + '/' + req[1]
  format = req[2].split('.')[1]

  halt 415 unless %w(svg png).include? format

  content_type format
  subject = params['subject'] || DEFAULT_SUBJECT

  begin
    version = DockerHub.last_artifact_version(repository)
    color = :brightgreen
  rescue NotFoundError
    version = 'unknown'
    color = :lightgray
  end

  style = params[:style] || DEFAULT_STYLE

  Shields.badge_image(subject, version, color, format, style)
end

get '/' do
  content_type :text
  "Nothing is here, see #{PROJECT_SITE}."
end

error do
  content_type :text
  halt 500, "Something went wrong, please open an issue on #{PROJECT_SITE}/issues"
end