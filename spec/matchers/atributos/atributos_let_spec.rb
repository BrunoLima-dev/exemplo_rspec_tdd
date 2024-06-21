require 'pessoa'

describe 'Atributos' do
  # before(:each) do
  #   @pessoa = Pessoa.new
  # end

  let(:pessoa) { Pessoa.new }

  it 'have_attributes' do
    pessoa.nome = 'Bruno'
    pessoa.idade = 20
    puts pessoa.inspect

    expect(pessoa).to have_attributes(nome: a_string_starting_with('B'), idade: (a_value >= 20))
  end

  it 'have_attributes' do
    pessoa.nome = 'Jose'
    pessoa.idade = 25
    puts pessoa.inspect

    expect(pessoa).to have_attributes(nome: a_string_starting_with('J'), idade: (a_value >= 20))
  end
end
