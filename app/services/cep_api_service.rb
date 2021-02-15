require 'rest-client'
class CepApiService
  URL = "http://cep.la"

  def self.save_address(cep, user)
    url = "#{URL}/#{cep}"
    response = RestClient.get(url, headers={'Accept' => 'application/json'})
    result = JSON.parse(response.body)

    unless result.blank?
      Address.create(
        user: user,
        cep: result['cep'],
        uf: result['uf'],
        cidade: result['cidade'],
        bairro: result['bairro'],
        logradouro: result['logradouro']
      )
    end

  end

  def self.get_address(cep, user)
      addresses =  Address.where(cep: cep, user: user)
      return addresses.count > 0 ? get_address_cached(cep, user) : save_address(cep,user)
  end

  def self.get_address_cached(cep, user)
      address =  Address.find_by(cep: cep, user: user)
      return address
  end

end