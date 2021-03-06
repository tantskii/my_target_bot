require 'watir'

class AdUnitCreator
  attr_reader :browser, :link

  TEST_LINK   = 'https://target-sandbox.my.com/'
  ORIGIN_LINK = 'http://target.my.com/'

  def initialize(user, environment)
    @user         = user
    @browser      = Watir::Browser.new :firefox

    @link         = TEST_LINK if environment == :test
    @link         = ORIGIN_LINK if environment == :origin
    @authenticate = false
  end

  def authenticate_user
    button_class = 'button button_submit'
    login_class  = 'auth-popup__input auth-popup__input_txt auth-popup__input_login'
    password_class = 'auth-popup__input auth-popup__input_txt auth-popup__input_login'

    @browser.goto login_url

    # @browser.text_field(type: 'text').set @user.login
    @browser.text_field(name: 'login').wait_until(&:present?).set @user.login

    # @browser.text_field(type: 'password').set @user.password
    @browser.text_field(name: 'password').wait_until(&:present?).set @user.password

    @browser.button(class: button_class).wait_until(&:present?).click

    return false unless @browser.url.match 'pad_groups'

    @authenticate = true

    true
  end

  def create_app(app, placement)
    if authenticate?
      app_name_class       = 'pad-setting__description__input js-setting-pad_description js-setting-field'
      url_class            = 'pad-setting__url__input js-setting-pad-url'
      placement_name_class = 'adv-block-form__row__input js-adv-block-description js-adv-block-field'
      button_class         = 'main-button__label'

      @browser.goto create_url

      @browser.text_field(class: app_name_class).wait_until(&:present?).set app.name
      @browser.text_field(class: url_class).wait_until(&:present?).set app.url

      @browser.text_field(class: placement_name_class).wait_until(&:present?).set placement.name
      @browser.span(title: placement.type).wait_until(&:present?).click
      @browser.span(class: button_class).wait_until(&:present?).click
    else
      nil
    end
  end

  def authenticate?
    @authenticate
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
    @browser.wait_while(timeout: 30, message: msg) {current_url == create_url}
  end
end