PATH = 'balance.txt'.freeze
STARTING_BALANCE = 100.00

def balance
  File.read(PATH.to_s)
end

def deposit
    balance = File.open('balance.txt', 'r')
    depositValue = gets.chomp.to_f
    balanceValue = balance.read
    value = balanceValue.chomp.to_f
    if depositValue < 0
        abort 'Введено отрицательное число!'
        exit
    end
    value += depositValue
    File.open(PATH.to_s, 'w') do |file|
        file.puts(value)
    end
    puts("Новый баланс: #{value}")
    balance.close
end

def withdraw
    balance = File.open('balance.txt', 'r')
    withdrawValue = gets.chomp.to_f
    balanceValue = balance.read
    value = balanceValue.chomp.to_f
    abort 'Введено отрицательное число!' if withdrawValue < 0
    abort 'Нехватает средств!' if value < withdrawValue
    value -= withdrawValue
    File.open(PATH.to_s, 'w') do |file|
        file.puts(value)
    end
    puts("Новый баланс: #{value}")
    balance.close
end

def main
    if File.file? PATH.to_s
        balance
    else
        file = File.open(PATH.to_s, 'w')
        file.puts(STARTING_BALANCE).to_s
        file.close
    end
    loop do
        puts 'Выберите, что хотите сделать:'
        puts 'B - Показать баланс'
        puts 'D - Пополнить'
        puts 'W - Списать'
        puts 'Q - Выйти'
        i = gets.chomp.upcase
        case i
        when 'D'
          print('Сумма пополнения: ')
          deposit
        when 'W'
          print('Сумма списания: ')
          withdraw
        when 'B'
          puts("Баланс #{balance}")
        when 'Q'
          break
        end
    end
end

main