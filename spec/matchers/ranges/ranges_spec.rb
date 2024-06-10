describe (1..5), 'Ranges testing' do
  it '#cover' do
    is_expected.to cover(2) # é a mesma coisa de usar o expect(subject).to cover(2)
    expect(subject).to cover(2) # verifica se o range cobre o valor 2
    expect(subject).to cover(2, 5) # verifica se o range cobre os valores 2 e 5
    expect(subject).not_to cover(0, 6) # verifica se o range não cobre os valores 0 e 6
  end

  it { is_expected.to cover(2) } # é a mesma coisa de usar o expect(subject).to cover(2)
  it { is_expected.to cover(2, 5) } # verifica se o range cobre os valores 2 e 5
  it { is_expected.not_to cover(0, 6) } # verifica se o range não cobre os valores 0 e 6

  it { expect(subject).to cover(2) }
end
