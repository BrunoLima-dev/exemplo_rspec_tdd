describe HTTParty do
  it 'content-type' do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
    # to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

    VCR.use_cassette('jsonplaceholder/posts') do
      response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
    end
  end
end
