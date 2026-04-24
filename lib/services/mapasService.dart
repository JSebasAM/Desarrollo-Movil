import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/mapas.dart';


class MapasService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<List<MapasModel>> getMapas() async {
    final response = await http.get(Uri.parse('$baseUrl/Map'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      if (decoded is! List) {
        throw Exception('Formato inesperado: se esperaba una lista JSON');
      }

      return decoded
          .map((mapa) => MapasModel.fromJson(mapa as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load mapas');
    }
  }

  Future<MapasModel> getMapaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/Map/$id'));

    if (response.statusCode == 200) {
      return MapasModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load mapa');
    }
  }
}
