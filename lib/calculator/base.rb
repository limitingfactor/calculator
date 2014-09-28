module Calculator
  class Base
    def add(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:+)
    end

    def subtract(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:-)
    end

    def multiply(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:*)
    end

    def divide(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:/)
    end

    def power(*args)
      fail ArgumentError unless args.flatten.length > 1
      args.flatten.map(&:to_s).map { |value| BigDecimal.new(value) }.inject(:**)
    end

    def root(*args)
      fail ArgumentError unless args.flatten.length > 1
      args_copy = args.flatten[1..-1].map { |number| inverse(number) }.unshift(args[0])
      power(args_copy)
    rescue FloatDomainError
      BigDecimal.new('Infinity')
    end

    def inverse(number)
      divide(1, number)
    end

    def factorial(number)
      fail ArgumentError unless Integer(number) >= 0
      number.to_i == 0 ? 1 : multiply(*(1..number))
    end
  end
end
