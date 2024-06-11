describe "satisfy" do
  it { expect(10).to satisfy { |x| x % 2 == 0 } } # Aqui verificamos se o número é par

  it {
    expect(9).to satisfy("be a multiple of 3") do |x|
      x % 3 == 0 # Aqui verificamos se o número é múltiplo de 3
    end
  }
end
