# Para rodar todos os teste em ordem aleatoria, utilize o comando bin/rspec --order random
# Para fazer o mesmo teste que acabou de rodar na mesma ordem utilize o comando bin/rspec --seed 12345

describe HTTParty do
  # >> O match_requests_on: [:body] é utilizado para comparar o corpo da requisição
  # it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do

  # >> O record => :new_episodes é utilizado para gravar novos episódios se o arquivo de fita não existir
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
    # to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

    response = HTTParty.get("http://jsonplaceholder.typicode.com/posts/4")
    content_type = response.headers['content-type']
  end
end
