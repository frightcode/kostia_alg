### KOSTIA'S ALGORYTHM BY D@iVeR (Rustam Ibragimov) v0.1
# 50
# 1 = 1
# 2 = ?
# 3 = ?
# 4 = ?
# 5 = ?
# 2+3+4+5 = 50
# 2 = random такой, что 50 - random >= count_of_остаток_количества_переменных
# number - наша сумма
# count - количество чисел, которыев сумме дают number

def wow(number, count)
  ary = Array.new # создадим пустой набор чисел
  rnd = Random.new # создадим генератор, который будет генерировать случайные числа

  # будем генерировать числа методом вычета случайных чисел из общей суммы number 
  # условие цикла: пока сумма не равна нули И пока количество чисел не равн нулю 
  # (т.е. на каждом проходе цикла вычитаем сууму из number и уменьшяем количество
  #  ненайденных чисел суммы)
  while (number != 0) && (count != 0) do
  
    # если это последнее ненайденное число, то остаток от number и есть последнее число
    if count == 1
      n = number
    else # иначе
      # генерируем случайное число
      n = rnd.rand(1..number)

      # случанйное число должно быть таким, чтобы сумма number была больше, чем
      # количество оставшихся неоткрытых чисел.
      # нужно для того, чтобы каждое число было равно хотябы 1 (единице).
      while ( (( number - n ) < ( count )) )
        n = rnd.rand(number)
      end
    end

    # когда нашли случайное число - запоминаем его в ary, уменьшяем колчиество ненайденных чисел
    # (count -= 1) и вычитаем из общей суммы уже найденное число (number -= n).

    ary.push(n)
    count -= 1
    number -= n

    # таким образом:
    # 1) нашли случайное число, оторое входит в сумму number и при этом, если из суммы вычесть это число -
    # сумма как минимум будет равна количеству неоткрытых чисел
    # 2) вычитаем из суммы найденное число и уменьшаем количество неоткрытых чисел - 
    #   получим новую сумму и новое количество переменных, а алгоритм сведется к тем же действиям,
    # что мы прворачивали в цикле.
  end

  ary.shuffle
end
puts wow(50, 5)