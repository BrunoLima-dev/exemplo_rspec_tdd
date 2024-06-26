RSpec::Matchers.define_negated_matcher :be_not_within, :be_within # define um matcher negado

# espero que o numero 12.5 esteja com a diferença de no maximo 0.5 do numero 12
# exemplo: 11.5, 11.6, 11.7, 11.8, 11.9, 12, 12.1, 12.2, 12.3, 12.4 12.5
# delta = 0.5

describe 'be_within' do
  it { expect(12.5).to be_within(0.5).of(12.0)}
  it { expect(11.4).to be_not_within(0.5).of(12.0)}
  it { expect([11.6, 12.1, 12.5]).to all(be_within(0.5).of(12.0))}
end
