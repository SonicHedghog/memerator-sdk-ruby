# The Memerator Stats
class Memerator::Stats
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [Integer] the total number of Memerator memes
  def memes
    @data['memes']
  end

  # @return [Integer] the total number of ratings
  def ratings
    @data['ratings']
  end

  # @return [Integer] the number of registered website users
  def users
    @data['website_users']
  end

  # @return [Integer] the total number of people who have submitted a meme
  def memers
    @data['unique_memers']
  end
end
