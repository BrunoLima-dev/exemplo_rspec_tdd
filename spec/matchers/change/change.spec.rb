require 'contador'

describe 'Matcher change' do
  it { expect { Contador.incrementa }.to change { Contador.qtd } } # qtd = 1
  it { expect { Contador.incrementa }.to change { Contador.qtd }.by(1) } # qtd = 2 tem 1 espero 1
  it { expect { Contador.incrementa }.to change { Contador.qtd }.from(2).to(3) } # qtd = 3 tem 2 espero 3
end
