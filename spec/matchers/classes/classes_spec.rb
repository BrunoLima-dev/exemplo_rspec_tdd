require 'string_nao_vazia'

describe 'Classes e Tipos' do
  it 'be_instance_of' do
    expect(10).to be_instance_of(Integer) # Exatamente a classe
  end

  it 'be_kind_of' do
    str = StringNaoVazia.new
    expect(str).to be_kind_of(String) # Pode ser por herança
    expect(str).to be_kind_of(StringNaoVazia) # Pode ser por herança
    expect(10).to be_kind_of(Integer) # Pode ser por herança
  end

  it 'be_an / be_a' do
    str = StringNaoVazia.new

    expect(str).to be_an(String) # Pode ser por herança
    expect(str).to be_an(StringNaoVazia) # Pode ser por herança

    expect(str).to be_a(String) # Pode ser por herança
    expect(str).to be_a(StringNaoVazia) # Pode ser por herança
  end

  it 'reponde_to' do
    expect('ruby').to respond_to(:size)
    expect('ruby').to respond_to(:count)
  end
end
