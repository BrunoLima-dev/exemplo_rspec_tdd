require 'student'
require 'course'

# MOCKS em 4 fases
# 1 - Setup: Configura o cenário
# 2 - Verify: Verifica se o resultado é o esperado
# 3 - Exercise: Executa o código a ser testado
# 4 - Teardown: Limpa o cenári
# Mocks são usados para testar comportamento

describe 'Mocks' do
  it '#bar' do
    # 1 Setup
    student = Student.new

    # 2 Verify
    expect(student).to receive(:bar)

    # 3 Exercise
    student.bar
  end
  # MOCK Expectations

  # expect(obj).to receive(:message).once
  # expect(obj).to receive(:message).twice
  # expect(obj).to receive(:message).exactly(3).times
  # expect(obj).to receive(:message).at_least(:once)
  # expect(obj).to receive(:message).at_least(:twice)
  # expect(obj).to receive(:message).at_least(n).times

  it 'args' do
    student = Student.new
    expect(student).to receive(:foo).with(123)
    student.foo(123)
  end

  it 'repetição' do
    student = Student.new
    expect(student).to receive(:foo).with(123).twice
    student.foo(123)
    student.foo(123)
  end

  # Mocks com valores de retorno
  it 'retorno' do
    student = Student.new
    expect(student).to receive(:foo).with(123).and_return(true)
    student.foo(123)
  end
end
