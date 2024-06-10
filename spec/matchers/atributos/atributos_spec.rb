require 'pessoa'
# Para testar os atributos de uma classe, podemos usar o método have_attributes

describe 'Atributos' do
  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = 'Bruno'
    pessoa.idade = 38

    expect(pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 38))
  end
end
