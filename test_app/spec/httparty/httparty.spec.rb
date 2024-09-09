describe HTTParty do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
    # to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

    response = HTTParty.get("http://jsonplaceholder.typicode.com/posts/#{[1,2,3,4,5].sample}")
    content_type = response.headers['content-type']
  end
end
