require 'calculator'

describe Calculator, ':Sobre a calculadora' do

  context '#div' do
    it 'divide by 0' do
      expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError)
      expect{subject.div(3, 0)}.to raise_error('divided by 0')
      expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError, 'divided by 0')
      expect{subject.div(3, 0)}.to raise_error(/divided/)
    end
  end

  context '#sum' do
    it 'positive numbers' do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'negative numbers and positive numbers' do
      result = subject.sum(-5, 7) # fazendo desta forma é a mesma coisa que vc estanciar a classe
      expect(result).to eq(2)
    end

    it 'negative numbers' do
      result = subject.sum(-5, -7)
      expect(result).to eq(-12)
    end
  end
end
