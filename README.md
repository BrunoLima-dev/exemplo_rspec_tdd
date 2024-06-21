**Teste RSpec Capybara**

## Conceitos

* **RSpec:** Framework de teste para Ruby que utiliza a metodologia BDD (Behavior Driven Development).
* **Capybara:** Driver de interface de usuário para RSpec que simula o comportamento de um navegador.

## RSpec

* **Descreva o comportamento do sistema:** Use `describe` e `it` para descrever o comportamento esperado do sistema.
* **Use expectativas:** Verifique se o comportamento real corresponde ao esperado usando `expect`.
* **Agrupe testes:** Use `context` para agrupar testes relacionados.

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
