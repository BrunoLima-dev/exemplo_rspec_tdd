require 'pessoa'
# Para testar os atributos de uma classe, podemos usar o método have_attributes

describe 'Atributos' do
  before(:each) do
    puts ">>>>>>>> ANTES DE CADA TESTE <<<<<<<<"
    @pessoa = Pessoa.new
  end

  after(:each) do
    @pessoa.nome = 'Sem nome'
    puts ">>>>>>>> DEPOIS DE CADA TESTE <<<<<<<< #{@pessoa.inspect}"
  end

  it 'have_attributes' do
    @pessoa.nome = 'Bruno'
    puts @pessoa.inspect
    @pessoa.idade = 38

    expect(@pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 38))
  end

  it 'have_attributes' do
    @pessoa.nome = 'José'
    puts @pessoa.inspect
    @pessoa.idade = 25

    expect(@pessoa).to have_attributes(nome: a_string_starting_with('J'), idade: (a_value >= 25))
  end
end
