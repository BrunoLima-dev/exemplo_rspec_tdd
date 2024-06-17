describe 'Ruby on Rails' do
  it { is_expected.to start_with("Ruby").and end_with("Rails") }
  it { expect(fruta).to eq('banana').or eq('laranja').or eq('uva') }

  # helper method arbitrário criei um modulo e adicionei este metodo lá
  # que esta dentro da pasta helpers.

  # def fruta
  #   %w(banana laranja uva).sample
  # end
end
