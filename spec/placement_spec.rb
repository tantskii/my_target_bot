require 'placement'

describe Placement do
  context '#construction' do
    type = :rewarded_video
    name = 'angry-birds'

    placement = Placement.new(type, name, :test)

    it 'return correct name' do
      expect(placement.name).to eq name
    end

    it 'return correct type' do
      expect(placement.type).to eq 'rewarded video'
    end
  end

  context 'types' do
    it 'returns correct hash with types in test environment' do
      test_hash = {
          standard:        'standard',
          leaderboard:     'leaderboard',
          rewarded_video:  'rewarded video',
          in_stream_video: 'in-stream video',
          medium:          'medium'
      }

      expect(Placement.types(:test)).to eq test_hash
    end

    it 'returns correct hash with types in origin environment' do
      origin_hash = {
          standard:        'standard',
          leaderboard:     'leaderboard',
          rewarded_video:  'rewarded video',
          in_stream_video: 'in-stream video',
          medium:          'medium',
          native:          'native',
          floating:        'floating',
          fullscreen:      'fullscreen'
      }

      expect(Placement.types(:origin)).to eq origin_hash
    end
  end
end