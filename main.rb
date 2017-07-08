require_relative 'lib/user'
require_relative 'lib/app'
require_relative 'lib/placement'
require_relative 'lib/ad_unit_creator'

require 'io/console'

NUMBER_OF_UNITS = 4
environment = [:test, :origin].first

puts 'Введите номер телефона или почту на которую зарегистрирован аккаунт в MyTarget'
login = STDIN.gets.chomp

puts 'Введите пароль'
password = STDIN.noecho(&:gets).chomp

user = User.new(login, password)

bot = AdUnitCreator.new(user, environment)

if bot.authenticate_user
  puts 'Авторизация пройдена'
else
  abort 'Возникла ошибка c авторизацией, проверьте Ваш логин и пароль'
end

puts 'Введите название приложения/сайта'
app_name =  STDIN.gets.encode("UTF-8").chomp

puts 'Введите ссылку на приложение/сайт'
app_url = STDIN.gets.chomp

app = App.new(app_url, app_name)

NUMBER_OF_UNITS.times do
  puts 'Введите название Вашего рекламного блока'
  placement_name = STDIN.gets.encode("UTF-8").chomp
  placement_type = Placement.types(environment).keys.sample

  placement = Placement.new(placement_type, placement_name, environment)

  puts 'Создание блока может занять некоторое время'
  bot.create_app(app, placement)

  bot.wait_for_creation
  puts "Блок #{placement_name} типа #{Placement.types(environment)[placement_type]} приложения #{app.name} создан"
  puts
end

bot.close_browser
