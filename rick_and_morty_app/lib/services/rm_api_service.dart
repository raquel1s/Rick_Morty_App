import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character.dart';

class RmApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  //garante que irá retornar uma lista, Future porque é um função async

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse("$baseUrl/character"));

    //verifica se tem resposta -
    if (response.statusCode == 200) {
      final data = json.decode(response.body); //body da onde vem os resultados
      final List results = data['results'];

      return results
          .map((json) => Character.fromJson(json))
          .toList(); // mapear itens da lista, json porque os itens da lista é json, transforma na lista para restorno
    } else {
      throw Exception("Falha ao carregar os personagens.");
    }
  }
}
