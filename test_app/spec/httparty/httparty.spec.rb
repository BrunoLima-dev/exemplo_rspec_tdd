describe HTTParty do
  it 'HTTParty' do
    response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    puats content_type
    expect(content_type).to match(/application\/json/)
  end
end
