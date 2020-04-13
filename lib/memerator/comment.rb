class Memerator::Comment
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [Integer] this comment's ID.
  def id
    @data['id']
  end

  # @return [String] the actual comment contents.
  def content
    @data['content']
  end

  # @return [Time] the timestamp of this comment
  def timestamp
    Time.parse(@data['timestamp'])
  end

  # @return [User] the author of this comment.
  def author
    Memerator::User.new(@data['author'])
  end

  # @return [Meme] the meme this comment is on.
  def meme
    Memerator::Meme.new(@data['meme'])
  end
end
