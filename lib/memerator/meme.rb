# A meme on memerator
class Memerator::Meme
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [String] the meme's ID.
  def memeid
    @data['memeid']
  end

  # @return [String, nil] the caption, if there is one.
  def caption
    @data['caption']
  end

  # @return [String] the URL of the image.
  def image_url
    @data['url']
  end

  # @return [Float] the average rating.
  def average_rating
    @data['rating']['average']
  end

  # @return [Time] the time this meme was submitted.
  def timestamp
    Time.parse(@data['timestamp'])
  end

  # @return [User] the author of this meme.
  def author
    Memerator::User.new(@data['author'])
  end

  # @return [String] the URL to the meme
  def meme_url
    @data['permalink']
  end
end
