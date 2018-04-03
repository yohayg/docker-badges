require 'httparty'
require 'uri'
require 'pry'


class DockerHub
  include HTTParty

  default_params wt: 'json'
  headers 'Accept' => 'application/json'
  format :json

  # Requests the last version of the specified artifact.
  def self.last_artifact_version(repository)
    response = HTTParty.get('https://registry.hub.docker.com/v2/repositories/' + repository + '/buildhistory')

    return 'unknown' if response.code != 200 or response['results'].nil? or response['results'].empty?

    build_status = response['results'][0]['status']
    return 'queued' if build_status == 0
    return 'failed' if build_status == -1
    return 'pass' if build_status == 10
    return 'in progress'

  end
end

class NotFoundError < StandardError;
end