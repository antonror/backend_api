json.pokemons do
  json.array!(@pokemons) do |pokemon|
    json.title pokemon.title
    json.description pokemon.body
  end
end