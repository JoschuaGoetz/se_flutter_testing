import requests
import json


class Pokemon:
    def __init__(self, name, desc, image, types):
        self.name = name
        self.description = desc
        self.image = image
        self.types = types

    def to_json(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True)

    def get_name(self):
        return self.name

    def get_description(self):
        return self.description

    def get_image(self):
        return self.image


# Uses the pokeapi to fetch a "pokedex" with all Pokemon of the selected generation
def get_pokemon_list():
    pokemon_list = []
    url = "https://pokeapi.co/api/v2/pokedex/2"  # 1 := National Dex #2 := Kanto Dex #3 := Johto Dex ...
    r = requests.get(url=url)
    data = r.json()

    print("Fetching {} Pokemon, this might take a second".format(len(data['pokemon_entries'])))

    for d in data['pokemon_entries']:
        p = get_pokemon(d['pokemon_species']['url'])
        if len(pokemon_list) % 50 == 0:
            print("Fetched {0}/{1}".format(len(pokemon_list), len(data['pokemon_entries'])))
            print(p.to_json())
        pokemon_list.append(
            {'name': p.get_name(), 'description': p.get_description(), 'image': p.get_image(), 'types': p.types})
    print("Fetched ", len(pokemon_list), " Pokemon")
    return pokemon_list


# Uses a deep call from get_pokemon to get more details about the pokemon
def get_pokemon(url):
    r = requests.get(url=url)
    data = r.json()
    pokemon_detail = get_detail(data['id'])
    return Pokemon(data['name'], get_english_desc(data['flavor_text_entries']),
                   pokemon_detail['sprites']['front_default'],
                   [str(d['type']['name']).capitalize() for d in pokemon_detail['types']])


# Because of the description being a dic with multiple languages we go through each language and pick the first english one
def get_english_desc(data):
    for d in data:
        if d['language']['name'] == 'en':
            return d['flavor_text'].replace('\n', ' ')


# Another deep call for even more information
def get_detail(id):
    url = "https://pokeapi.co/api/v2/pokemon/" + str(id)
    r = requests.get(url=url)
    data = r.json()
    return data
