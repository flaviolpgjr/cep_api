class GetAddressTest < ActionDispatch::IntegrationTest
  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:user_test).id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  test 'Unauthorized user test' do
    get '/addresses/36200034'

    assert_response :unauthorized
  end

  test 'Get address test' do
    get '/addresses/362000197', headers: authenticated_header

    result = JSON.parse(response.body)

    assert_equal true, result.empty?

    assert_response :not_found

    assert_equal 0, Address.count

    get '/addresses/36200034', headers: authenticated_header

    result = JSON.parse(response.body)

    assert_equal 1 , Address.count

    address = Address.last

    assert_equal address.cep,        result["cep"]
    assert_equal address.uf,         result["uf"]
    assert_equal address.cidade,     result['cidade']
    assert_equal address.bairro,     result['bairro']
    assert_equal address.logradouro, result['logradouro']

    assert_response :success
  end
end