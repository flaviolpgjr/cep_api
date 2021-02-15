# CEP-API

API, que faz busca do endereço através, do cep através do site: http://cep.la


### Solução

Foi desenvolvida uma API em rails 6, utilizando a gem rest-client para realizar a consulta no site, para a autenticação foi utilizado JWT(gem knock), na parte de busca principal foi utilizado services, com a finalidade de retirar a logica de busca e do controller.

Para melhorar a performance, quando um usuario ja consultou determinado endereço, ao invés de realizar a consulta no site, são retornadas as informações do banco de dados.

#### Instalando o projeto

Para instalar as dependencias do projeto recomenda-se

1. ```bundle install```

2. ```rails db:create db:migrate db:seed```

#### Testando o projeto

Para testar o projeto, recomenda-se postman ou insomnia.

1. Primeiramente rode o projeto através do comando: ```rails s```
2. Para pegar um token de autenticação realizar uma chamada POST para: ```localhost:3000/auth```
  passando o seguinte json:

  ```
  {
    "auth":{
      "email":"teste@example.com",
      "password":"123456"
    }
  }
  ```
  o endpoint ira retornar um JWT.

3. Pegar esse jwt e adicionar na aba de autenticação do seu cliente(Insomnia ou postman), lembrando de selecionar a forma de autenticação Bearer token.

4. Após o token adicionado, para consultar um endereço utilizar uma chamada GET para: ```localhost:3000/addresses/:cep```
   onde :cep, será o cep que deseja consultar>

### Rodando os testes

1. Para rodar os testes utilizar o comando: ```rake test```