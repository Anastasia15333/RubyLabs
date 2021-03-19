
def Student(age)
    file = File.open('file.txt')
    result = File.open('result.txt', 'w')
    file_data = file.readlines.map(&:chomp)
    i = 0
    while i < file_data.length
      str = file_data[i]
      result.puts(str) if str[-2, 2] == age
      i += 1
    end
    file.close
    result.close
    puts(file_data = File.read('result.txt').split("\n"))
end

def main
    loop do
        puts 'Выберите, что хотите сделать:'
        puts '1 - Выбрать студентов по возрасту'
        puts '-1 - Выход'
        i = gets.chomp
        case i
        when '1'
            print 'Введите возраст студентов: '
            age = gets.chomp
            Student(age)
            puts(file_data = File.read('result.txt').split("\n"))
        when '-1'
            break
        end
        
    end
end

main