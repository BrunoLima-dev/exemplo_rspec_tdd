# O que for colacado no describe é instanciado para poder usar o (subject)
# O subject é uma instância da classe que foi passada no describe
# O subject é instanciado automaticamente
describe [1, 2, 3] do
  it 'Array' do
    expect(subject).to be_kind_of(Array)
  end
end
