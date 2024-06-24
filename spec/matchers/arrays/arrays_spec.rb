RSpec::Matchers.define_negated_matcher :exclude, :include # define um matcher negado

describe Array.new([1, 2, 3]), 'Array testing' do
  it '#include' do
    expect(subject).to include(2, 3) # verifica se contain os elementos separados
  end

  it { expect(subject).to exclude(4)} # verifica se não contém o elemento

  it '#contain_exactly' do
    expect(subject).to contain_exactly(1, 2, 3) # verifica se contain os elementos exatos, mas não importa a ordem
  end

  it '#match_array' do
    expect(subject).to match_array([3, 2, 1]) # verifica se contain os elementos exatos, mas não importa a ordem
  end
end
