$COUNTER = 0 # variável global

describe 'let' do
  let(:count) { $COUNTER += 1 } # toda vez que chamar count, vai incrementar 1 quando for um novo teste

  it 'memoriza o valor' do
    expect(count).to eq(1) # 1a vez é carregado
    expect(count).to eq(1) # 2a vez é memorizado
    puts count
  end

  it 'não é cacheado entre os testes' do
    expect(count).to eq(2) # 1a vez é carregado mas vai pegar o valor que já esta em cache
    puts count
  end
end
