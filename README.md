**Teste RSpec Capybara**

## Conceitos

* **RSpec:** Framework de teste para Ruby que utiliza a metodologia BDD (Behavior Driven Development).
* **Capybara:** Driver de interface de usuário para RSpec que simula o comportamento de um navegador.

## RSpec

* **Descreva o comportamento do sistema:** Use `describe` e `it` para descrever o comportamento esperado do sistema.
* **Use expectativas:** Verifique se o comportamento real corresponde ao esperado usando `expect`.
* **Agrupe testes:** Use `context` para agrupar testes relacionados.
  
## Adiciona configuração do RSpec

### Adições
* Gem rspec-rails:
* Adicionei a gem rspec-rails, versão ~> 5.0.0 ao Gemfile e executei bundle install.

### Criação do banco de dados de teste:
* Após adicionar a gem, criei o banco de dados de teste executando:

`rails db:create:all
`

### Instalação do RSpec:
* Instalei o RSpec com:

`rails g rspec:install
`
* Isso criou a pasta spec.

### Gem spring-commands-rspec:
* Adicionei a gem spring-commands-rspec ao Gemfile e rodei:

`bundle exec spring binstub rspec
`
ou
`bundle exec spring binstub --all
`
* Isso cria um binário dentro da pasta bin chamado rspec, melhorando a velocidade ao executar os comandos do RSpec.

### Configuração dos generators no config/application.rb:
* Adicionei a seguinte configuração para usar o RSpec como framework de teste e desabilitar a geração de testes para fixtures, views, helpers e routing:

`config.generators do |g|
  g.test_framework :rspec,
    fixtures: false,
    view_specs: false,
    helper_specs: false,
    controller_specs: true,
    routing_specs: false
end
`

### Gem capybara:
* Adicionei a gem capybara ao Gemfile. Ela é necessária quando criamos testes automáticos usando o scaffold.

`gem capybara`


### Scaffolding
* Scaffold Customer:
* Gereei o scaffold para Customer com os atributos name (string) e email (string):

`rails g scaffold Customer name:string email:string
`
* Depois rodei 
`rails db:migrate
`

* E depois rodei o teste
`bin/rails
`
## Factory Girl e VCR

* **Factory Girl:** Cria objetos de teste válidos com atributos predefinidos.
* **VCR:** Grava e reproduz solicitações HTTP, evitando chamadas reais à API durante os testes.

## Modelos e Controladores

* **Testando modelos:** Use `shoulda-matchers` para testar a lógica de validação e associação do modelo.
* **Testando controladores:** Use `request_specs` para testar as ações do controlador e as respostas de visualização.

## Views usando Capybara

* **Simulando interações do usuário:** Use métodos como `visit`, `click_link` e `fill_in` para simular interações do usuário na interface do usuário.
* **Verificando o conteúdo da página:** Use `expect` para verificar se o conteúdo da página corresponde ao esperado.

## Testando APIs

* **Use bibliotecas de teste de API:** Como `rspec-api` ou `webmock` para testar endpoints de API.
* **Verifique códigos de status e respostas:** Use `expect` para verificar se os códigos de status e as respostas da API são os esperados.

## Desenvolvendo um CRUD

* **Criação (Create):** Teste a criação de um novo registro usando `post` e verificando a resposta.
* **Leitura (Read):** Teste a obtenção de um registro existente usando `get` e verificando a resposta.
* **Atualização (Update):** Teste a atualização de um registro existente usando `put` e verificando a resposta.
* **Exclusão (Delete):** Teste a exclusão de um registro existente usando `delete` e verificando a resposta.

**Exemplo de teste usando RSpec e Capybara:**

```
require 'rails_helper'

RSpec.describe "Creating a new task", type: :feature do
  it "allows a user to create a new task" do
    visit root_path
    click_link "New Task"
    fill_in "Title", with: "Buy milk"
    click_button "Create Task"
    expect(page).to have_content "Task was successfully created"
  end
end
```
