require 'pessoa'
# Para testar os atributos de uma classe, podemos usar o método have_attributes

describe 'Atributos' do
  before(:context) do
    puts ">>>>>>>> ANTES DE TODOS OS TESTES <<<<<<<<"
  end

  after(:all) do
    puts ">>>>>>>> DEPOIS DE TODOS OS TESTES <<<<<<<<"
    puts " "
  end

  # before(:each) do
  #   puts ">>>>>>>> ANTES DE CADA TESTE <<<<<<<<"
  #   @pessoa = Pessoa.new
  #   puts " "
  # end

  # after(:each) do
  #   @pessoa.nome = 'Sem nome'
  #   puts ">>>>>>>> DEPOIS DE CADA TESTE <<<<<<<< #{@pessoa.inspect}"
  #   puts " "
  # end

  around(:each) do |teste|
    puts "ANTES"
    @pessoa = Pessoa.new

    teste.run # roda o teste

    @pessoa.nome = 'Sem nome'
    puts "DEPOISSSS"
  end

  it 'have_attributes' do
    @pessoa.nome = 'Bruno'
    puts @pessoa.inspect
    @pessoa.idade = 38

    expect(@pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 38))
    puts " "
  end

  it 'have_attributes' do
    @pessoa.nome = 'José'
    puts @pessoa.inspect
    @pessoa.idade = 25

    expect(@pessoa).to have_attributes(nome: a_string_starting_with('J'), idade: (a_value >= 25))
    puts " "
  end
end
