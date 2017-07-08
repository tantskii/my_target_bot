require 'app'

describe App do
  context '#construction' do
    app_url  = 'https://itunes.apple.com/us/app/angry-birds/id343200656?mt=8'
    app_name = 'angry-birds'

    app = App.new(app_url, app_name)

    it 'return correct url' do
      expect(app.url).to eq app_url
    end

    it 'return correct name' do
      expect(app.name).to eq app_name
    end
  end
end