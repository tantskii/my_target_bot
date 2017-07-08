require_relative 'lib/user'
require_relative 'lib/app'
require_relative 'lib/ad_unit_creator'

require 'io/console'

NUMBER_OF_UNITS = 4

puts 'Введите номер телефона или почту на которую зарегистрирован аккаунт в MyTarget'
login = STDIN.gets.chomp

puts 'Введите пароль'
password = STDIN.noecho(&:gets).chomp

user = User.new(login, password)
bot = AdUnitCreator.new(user)