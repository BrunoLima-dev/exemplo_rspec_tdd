describe 'Matchers de Comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 2
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 10
  end

  it '<=' do
    expect(5).to be <= 10
    expect(5).to be <= 5
  end

  it 'be_between inclusive' do
    expect(5).to be_between(2, 7).inclusive
    expect(2).to be_between(2, 7).inclusive
    expect(7).to be_between(2, 7).inclusive
  end

  it 'be_between inclusive', aggregate_failures: true do # Mostra todas as falhas de uma so vez
    expect(5).to be_between(2, 7).inclusive
    expect(1).to be_between(2, 7).inclusive # Falha
    expect(8).to be_between(2, 7).inclusive # Falha
  end

  it 'be_between inclusive', :aggregate_failures do # Mostra todas as falhas de uma so vez
    expect(5).to be_between(2, 7).inclusive
    expect(1).to be_between(2, 7).inclusive # Falha
    expect(8).to be_between(2, 7).inclusive # Falha
  end

  it 'be_between inclusive / Falhas agregadas' do
    aggregate_failures do # Mostra todas as falhas de uma so vez
      expect(5).to be_between(2, 7).inclusive
      expect(1).to be_between(2, 7).inclusive # Falha
      expect(8).to be_between(2, 7).inclusive # Falha
    end
  end

  it 'be_between exclusive' do
    expect(5).to be_between(2, 7).exclusive
    expect(3).to be_between(2, 7).exclusive
    expect(4).to be_between(2, 7).exclusive
  end

  it 'match regex' do
    expect('fulano@com.br').to match(/..@../)
  end

  it 'start_with' do
    expect('fulano de tal').to start_with('fulano')
    expect([1, 2, 3]).to start_with(1)
  end

  it 'end_with' do
    expect('fulano de tal').to end_with('tal')
    expect([1, 2, 3]).to end_with(3)
  end
end
