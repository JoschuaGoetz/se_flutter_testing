from flask import Flask, json, jsonify
import pokemon as pokemon

pokemon = pokemon.get_pokemon_list()

app = Flask(__name__)

urls = [{"/pokemon": "Get all 151 pokemon"}]

@app.route('/')
def hello_world():
    return json.dumps(urls)


@app.route('/pokemon', methods=['GET'])
def get_pokemon():
  return json.dumps(pokemon, ensure_ascii=False).encode('utf-8')


if __name__ == '__main__':
    app.run()
