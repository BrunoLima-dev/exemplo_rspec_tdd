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
end
