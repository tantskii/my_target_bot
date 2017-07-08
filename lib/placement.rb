class Placement
  def initialize(type, name)
    @type = Placement.test_types[type]
    @name = name
  end

  def self.test_types
    {
        standard:        'standard',
        leaderboard:     'leaderboard',
        rewarded_video:  'rewarded video',
        in_stream_video: 'in-stream video',
        medium:          'medium'
    }
  end

  def self.types
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