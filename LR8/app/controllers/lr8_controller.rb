class Lr8Controller < ApplicationController
  def is_div5(x)
    flag = true
    flag = false if x == 1
    while x > 1
      flag = false unless x % 5 == 0
      x = x / 5
    end

    return flag
  end

  def input
  end

  def view
    begin
      flagerror = false
      number_of_values = Float(params[:number])
      mass_of_values = params[:values].split(' ')
      mass_testing = []
      0.upto(number_of_values - 1) {|x| mass_testing[x] = 0}
      0.upto(mass_of_values.length - 1) { |x|
        mass_testing[x] = Float(mass_of_values[x])
      }
    rescue
      number_of_values = 0
      mass_of_values = []
      flagerror = true
    end

    number_of_values = params[:number].to_i
    mass_of_values = params[:values].split(' ') unless params[:values].class.name == "NilClass"
    0.upto(mass_of_values.length - 1) { |x|
      mass_of_values[x] =mass_of_values[x].to_i
    }
  
    @segments = []
    @count_of_segments = 0
    @max_segment = " "
    length_of_max = 0
    current_length = 1
    current_segment = []
    previous = 1
    mass_of_values.each { |x|
      current_segment << previous
      if is_div5(previous) && is_div5(x)
        current_length += 1
      elsif is_div5(x) == false
        if current_length > length_of_max
          length_of_max = current_length
          @max_segment = current_segment 
        end
        @count_of_segments += 1 if current_length > 1
        @segments << current_segment if current_length > 1
        current_length = 1
        current_segment = []
      else
        current_segment = []
      end 
      previous = x
    }
    if current_length > length_of_max
      length_of_max = current_length
      @max_segment = current_segment 
    end
    @count_of_segments += 1 if current_length > 1
    if current_length > 1
      current_segment << mass_of_values[number_of_values - 1]
      @segments << current_segment 
    end

    if @count_of_segments == 0
      @count_of_segments = "Таких отрезков нет"
      @segments = " "
      @max_segment = " "
    end

    if flagerror || number_of_values != mass_of_values.length
      @segments = "Введены некорректные данные"
      @count_of_segments = "Введены некорректные данные"
      @max_segment = "Введены некорректные данные"
    end

  end
end
