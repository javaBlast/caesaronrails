json.array!(@crypts) do |crypt|
  json.extract!  crypt, :id, :decrypt, :encrypt, :shift
  json.url crypt_url(crypt, format: :json)
end
