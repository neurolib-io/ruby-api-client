module NeurolibApiClient
  ##
  # Parent class for API requests
  #
  class ApiRequest
    require_relative 'hash_normalizer'
    include NeurolibApiClient::HashNormalizer
  end
end
