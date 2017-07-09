# my_target_bot

Бот для создания  рекламных мест (Ad unit) в рекламной сети [MyTaget](http://target.my.com/)

Так же существует возможность создания реклмных мест [тестовом окружении](https://target-sandbox.my.com).

# Что необходимо

Иметь аккаунт в сети MyTarget. Зарегистрироваться необходимо как publisher.

Осуществить регистрацию можно кликнув на [эту ссылку](https://account.my.com/signup/?lang=en&continue=https://target-sandbox.my.com/auth/mycom?state=target_login%3D1#email).

# Установка

Для работы бота необходимо иметь `ruby 2.4.0`(желательно указанной версии) и гем `watir`.

Для его установки введите в вашей консоли 

`gem install watir`

Так же установите гем `rspec`

`gem install rspec`

Далее скопируйте этот гит репозиторий или скачатйте архив кликнув на зеленую кнопку в верхнем правом углу.

Распакуйте архив в необходимую вам папку

Перейдите в нее с помощью команды в консоли

`cd path/to/my_target_bot`

И запускайте бота!

`ruby main.rb`

**Важно**

Установите Firefox если у вас его нет. Рекомендуемая версия Mozilla Firefox 54.0.

# Возможные проблемы и как их решить

Если вы увидели следующую ошибку:
/.../gems/selenium-webdriver-3.4.3/lib/selenium/webdriver/common/service.rb:59:in binary_path':  Unable to find Mozilla geckodriver. Please download the server from https://github.com/mozilla/geckodriver/releases and place it somewhere on your PATH. More info at https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver. (Selenium::WebDriver::Error::WebDriverError)

Заходите на [этот сайт](https://github.com/mozilla/geckodriver/releases) и скачайте драйвер для вашей операционной системы.
Например для 64 раздярного Linux это `geckodriver-v0.17.0-linux64.tar.gz`

Распакуйте архив в доступное место(далее `/path/to/geckodriver`)

Перейдите в папку куда вы распаковали архив в консоли

`cd path/to/my_target_bot`
 
 Выполните следующую команду
 
 **Для Linux**
 
`export PATH=$PATH:/path/to/geckodriver`

**Для Windows**

`set PATH=%PATH%;C:\path\to\geckodriver`

Снова запускайте бота

`ruby main.rb`



Ищите больше информации [тут](https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver).

# Рекомендации

Возможны проблемы при запуске на windows 
