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

  # @param perso [String, Integer] the ID of the user, or their username
  # @return [User] the user's profile
  def user(perso)
    return profile if perso.downcase == 'me'

    data = JSON.parse(RestClient.get("https://memerator.me/api/v1/profile/#{perso}", Authorization: @token))
    User.new(data)
  end

  # @return [Profile] your profile
  def profile
    data = JSON.parse(RestClient.get('https://memerator.me/api/v1/profile/me', Authorization: @token))
    Profile.new(data)
  end

  # Get a meme by its id
  # @param [String] the Meme ID
  # @return [Meme] the meme
  def meme(id)
    begin
      data = JSON.parse(RestClient.get("https://memerator.me/api/v1/meme/#{id}", Authorization: @token))
    rescue RestClient::NotFound
      raise Memerator::Errors::InvalidMeme, "This meme doesn't exist!"
    end
    Meme.new(data)
  end

  # Get a random meme
  # @return [Meme] the meme
  def randommeme
    data = JSON.parse(RestClient.get("https://memerator.me/api/v1/meme/random", Authorization: @token))
    Meme.new(data)
  end

  # @return [Stats] the site's stats
  def stats
    data = JSON.parse(RestClient.get('https://memerator.me/api/v1/stats', Authorization: @token))
    Stats.new(data)
  end

  # @return [Array<Notification>] your notifications
  def notifications
    notifications = JSON.parse(RestClient.get('https://memerator.me/api/v1/notifications', Authorization: @token))
    notifications.map { |notification_data| Notification.new(notification_data) }
  end

  # Get the token from instantiation
  attr_reader :token
end

# Require files.
require_relative 'memerator/meme'
require_relative 'memerator/errors'
require_relative 'memerator/stats'
require_relative 'memerator/notification'
require_relative 'memerator/user'
require_relative 'memerator/profile'
