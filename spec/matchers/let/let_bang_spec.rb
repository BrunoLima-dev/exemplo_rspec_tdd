$COUNT = 0

describe "let!" do
  ordem_de_invocacao = []

  let!(:contador) do # let! é executado antes do teste
    ordem_de_invocacao << :let!
    $COUNT += 1
  end

  it 'chama o método helper antes do teste' do
    ordem_de_invocacao << :exemplo

    expect(ordem_de_invocacao).to eq( [:let!, :exemplo] )
    puts "ordem_de_invocacao: #{ordem_de_invocacao}"

    expect(contador).to eq(1)
    puts "contador: #{contador}"
  end
end
