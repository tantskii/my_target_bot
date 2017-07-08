require 'watir'

class AdUnitCreator
  attr_reader :browser

  TEST_LINK = 'https://target-sandbox.my.com/'
  ORIGIN_LINK = 'http://target.my.com/'

  attr_reader :link
  def initialize(user, environment)
    @user = user
    @browser = Watir::Browser.new :firefox

    @link = TEST_LINK if environment == :test
    @link = ORIGIN_LINK if environment == :origin
  end

  def authenticate_user
    @browser.goto login_url

    @browser.text_field(type: 'text').set @user.login
    @browser.text_field(type: 'password').set @user.password
    @browser.button(class: 'button button_submit').click

    return false if @browser.url.match 'error_code'
    true
  end

  def create_app(app, placement)
    # TODO отлавливать ошибку с долгой загрузкой
    @browser.goto create_url

    @browser.text_field(class: 'pad-setting__description__input js-setting-pad_description js-setting-field').set app.name
    @browser.text_field(class: 'pad-setting__url__input js-setting-pad-url').set app.url

    @browser.text_field(class: 'adv-block-form__row__input js-adv-block-description js-adv-block-field').set placement.name
    @browser.span(title: placement.type).click
    @browser.span(class: 'main-button__label').click
  end

  def current_url
    @browser.url
  end

  def login_url
    @link + '#login'
  end

  def create_url
    @link + 'create_pad_groups/'
  end

  def close_browser
    @browser.close
  end

  def wait_for_creation
    msg = 'Проблема с загрузкой страницы, попробуйте позже'
    @browser.wait_while(timeout: 30, message: msg) { current_url == create_url }
  end
end