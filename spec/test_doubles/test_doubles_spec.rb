describe 'Test Doubles' do
  it 'should return a fake value' do
    user = double('User')
    allow(user).to receive_messages(name: 'Bruno', password: 'secret')
    puts user.name
    puts user.password
  end

  # Aqui vc pode ignorar o erro que venha de determinado dubler adicionando o as_null_object
  it 'is_null_object' do
    user = double('User').as_null_object
    allow(user).to receive_messages(name: 'Bruno', password: 'secret')
    puts user.name
    puts user.password
    user.abc
  end
end
