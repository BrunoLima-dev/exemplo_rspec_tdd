require 'string_nao_vazia'

describe String do
  describe 'StringNaoVazia' do

    subject { "Não sou vazio".force_encoding("UTF-8") }

    it 'Não esta vazio' do
      expect(subject).to eq("Não sou vazio".force_encoding("UTF-8"))
    end
  end
end
