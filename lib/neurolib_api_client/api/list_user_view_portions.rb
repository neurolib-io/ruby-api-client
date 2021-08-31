#
# This file is auto-generated, do not edit
#

module NeurolibApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  #List all the view portions ever submitted by a given user.
  #
  class ListUserViewPortions < ApiRequest
    attr_reader :user_id
    attr_accessor :timeout
    attr_accessor :ensure_https

  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user whose view portions are to be listed.
  #
    def initialize(user_id)
      @user_id = user_id
      @timeout = 100000
      @ensure_https = false
    end

    # HTTP method
    def method
      :get
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/users/#{@user_id}/viewportions/"
    end
  end
end
