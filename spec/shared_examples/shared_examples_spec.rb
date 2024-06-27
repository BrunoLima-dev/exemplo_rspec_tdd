require 'pessoa'

  # Essa forma é para quando temos um metodo que se repete em varios testes, assim ele fica denamico.
shared_examples 'status' do |sentimento|
  it "#{sentimento}" do
    pessoa.send("#{sentimento}!")
    expect(pessoa.status).to eq("Sentindo-se #{sentimento.capitalize}!")
  end
end

describe 'Pessoa' do
  subject(:pessoa) { Pessoa.new }

  include_examples 'status', :feliz
  it_behaves_like 'status', :triste
  it_should_behave_like 'status', :contente

  # Pode fazer desta forma aqui que esta a baixo ou pode fazer com shared_examples
  # it 'feliz' do
  #   pessoa.feliz!
  #   expect(pessoa.status).to eq('Sentindo-se Feliz!')
  #   puts "A pessoa esta se #{pessoa.status}"
  #   puts ""
  # end

  # it 'triste' do
  #   pessoa.triste!
  #   expect(pessoa.status).to eq('Sentindo-se triste!')
  #   puts "A pessoa esta se #{pessoa.status}"
  #   puts ""
  # end

  # it 'contente' do
  #   pessoa.contante!
  #   expect(pessoa.status).to eq('Sentindo-se contente!')
  #   puts "A pessoa esta se #{pessoa.status}"
  #   puts ""
  # end
end
