# A notification
class Memerator::Notification
  # @!visibility private
  def initialize(data)
    @data = data
  end

  # @return [Integer] the ID of this notification
  def id
    @data['id']
  end

  # @return [User] the sender of this notification.
  def sender
    Memerator::User.new(@data['sender'])
  end

  # @return [Time] the time this was sent
  def timestamp
    Time.parse(@data['timestamp'])
  end

  # @return [String] the notification, formatted.
  def message
    @data['message']
  end

  # @return [String] the raw message as it appears on Memerator.me
  def raw
    @data['raw']
  end

  # The type is mostly used internally but is useful for clients implementing notification sorting.
  # Type 0 is a meme rating notification
  # Type 1 is a follow notification
  # Type 2 is a notice.
  # Type 3 is a report status update
  # @return [Integer] the type of this message
  def type
    @data['type']
  end

  # For meme ratings, the meme ID is returned, if you need it!
  # @return [String, nil] the meme ID, if type == 0
  def memeid
    return nil if @data['meme'].nil?

    @data['meme']['memeid']
  end

  # For meme ratings, the meme rating is returned, if you need it!
  # @return [Integer, nil] the meme rating, if type == 0
  def rating
    return nil if @data['meme'].nil?

    @data['meme']['rating']
  end
end
