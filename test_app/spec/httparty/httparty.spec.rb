describe HTTParty do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts'} do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
    # to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

    response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
  end
end
