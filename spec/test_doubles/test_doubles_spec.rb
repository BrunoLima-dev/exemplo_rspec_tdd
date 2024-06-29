describe 'Test Doubles' do
  it 'should return a fake value' do
    user = double('User')
    allow(user).to receive_messages(name: 'Bruno', password: 'secret')
    puts user.name
    puts user.password
  end
end
