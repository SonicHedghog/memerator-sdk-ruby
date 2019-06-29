# Require external gems
require 'json'
require 'rest-client'

# All Memerator functionality, whether extended or just here.
class Memerator
  # Initialize a new Memerator object, via a token.
  # @param token [String] API token, taken from the Memerator Website.
  def initialize(token: nil)
    @token = token
  end

  # Get the token from instantiation
  attr_reader :token
end

# Require files.
