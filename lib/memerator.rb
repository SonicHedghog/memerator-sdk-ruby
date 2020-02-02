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
  # @raise [Memerator::Errors::InvalidUser] if the user does not exist
  # @return [User] the user's profile
  def user(perso)
    return profile if perso.downcase == 'me'

    data = JSON.parse(RestClient.get("https://api.memerator.me/v1/profile/#{perso}", Authorization: @token))

    User.new(data)
  rescue RestClient::NotFound
    raise Memerator::Errors::InvalidUser, "This user doesn't exist!"
  end

  # @return [Profile] your profile
  def profile
    data = JSON.parse(RestClient.get('https://api.memerator.me/v1/profile/me', Authorization: @token))
    Profile.new(data, token: @token)
  end

  # Get a meme by its id
  # @param id [String] the Meme ID
  # @raise [Memerator::Errors::InvalidMeme] if the meme does not exist.
  # @return [Meme] the meme
  def meme(id)
    data = JSON.parse(RestClient.get("https://api.memerator.me/v1/meme/#{id}", Authorization: @token))

    Meme.new(data, token: @token)
  rescue RestClient::NotFound
    raise Memerator::Errors::InvalidMeme, "This meme doesn't exist!"
  end

  # Get a random meme
  # @return [Meme] the meme
  def randommeme
    data = JSON.parse(RestClient.get("https://api.memerator.me/v1/meme/random", Authorization: @token))
    Meme.new(data, token: @token)
  end

  # @return [Stats] the site's stats
  def stats
    data = JSON.parse(RestClient.get('https://api.memerator.me/v1/stats', Authorization: @token))
    Stats.new(data)
  end

  # @return [Array<Notification>] your notifications
  def notifications
    notifications = JSON.parse(RestClient.get('https://api.memerator.me/v1/notifications', Authorization: @token))
    notifications.map { |notification_data| Notification.new(notification_data) }
  end

  # @return [Array<Report>] your reports
  def reports
    reports = JSON.parse(RestClient.get('https://api.memerator.me/v1/reports', Authorization: @token))
    reports.map { |report_data| Report.new(report_data) }
  end

  # Get the top memers (by meme count)
  # @return [Hash<User, Integer>] the top memers in a hash of user to their memes
  def topmemers
    users = JSON.parse(RestClient.get('https://api.memerator.me/v1/topmemers', Authorization: @token))
    top = {}
    users.each do |woah|
      top[User.new(woah['profile'])] = woah['memes']
    end
    top
  end

  # Get the token from instantiation
  attr_reader :token
end

# Require files.
require_relative 'memerator/meme'
require_relative 'memerator/errors'
require_relative 'memerator/stats'
require_relative 'memerator/report'
require_relative 'memerator/notification'
require_relative 'memerator/user'
require_relative 'memerator/profile'
