class CreateUserTokenTest < ActionDispatch::IntegrationTest
  test 'create user token' do
    post '/auth', params:{
      'auth':{
        'email': 'teste@example.com',
        'password': '123456'
      }
    }

    assert_response :success
  end
end