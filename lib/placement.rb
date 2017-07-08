class Placement
  attr_reader :type, :name

  def initialize(type, name, environment)
    @type        = Placement.types(environment)[type]
    @name        = name
  end

  def self.types(environment)
    if environment == :test
      {
          standard:        'standard',
          leaderboard:     'leaderboard',
          rewarded_video:  'rewarded video',
          in_stream_video: 'in-stream video',
          medium:          'medium'
      }
    elsif environment == :origin
      {
          standard:        'standard',
          leaderboard:     'leaderboard',
          rewarded_video:  'rewarded video',
          in_stream_video: 'in-stream video',
          medium:          'medium',
          native:          'native',
          floating:        'floating',
          fullscreen:      'fullscreen'
      }
    end
  end
end