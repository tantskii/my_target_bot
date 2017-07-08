require 'watir'

class AdUnitCreator
  TEST_LINK = 'https://target-sandbox.my.com/'
  ORIGIN_LINK = 'http://target.my.com/'

  def initialize(user)
    @user = user
    @browser = Watir::Browser.new :firefox
  end

  def authenticate_user
    # TODO отлавливать ошибку с неверным логином и паролем
    @browser.goto TEST_LINK + '#login'

    @browser.text_field(type: 'text').set user.login
    @browser.text_field(type: 'password').set user.password
    @browser.button(class: 'button button_submit').click
  end

  def create_app(app, placement)
    authenticate_user

    # TODO отлавливать ошибку с долгой загрузкой
    @browser.goto TEST_LINK + 'create_pad_groups/'

    @browser.text_field(class: 'pad-setting__description__input js-setting-pad_description js-setting-field').set app.name
    @browser.text_field(placeholder: 'Enter site/app URL').set app.url

    @browser.text_field(class: 'adv-block-form__row__input js-adv-block-description js-adv-block-field').set placement.name
    @browser.span(title: placement.type).click
    @browser.span(class: 'main-button__label').click
  end

  def create_ad_unit

  end

  def close_browser
    @browser.close
  end
end