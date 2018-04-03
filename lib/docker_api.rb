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

    return 'building' if response['results'][0]['status'] == 3

    return response['results'][0]['status'] == 10 ? 'pass' : 'fail'

  end
end

class NotFoundError < StandardError;
end