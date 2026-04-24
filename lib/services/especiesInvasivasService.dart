import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/especiesInvasivas.dart';

class EspeciesInvasivasService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<List<EspeciesInvasivasModel>> getEspeciesInvasivas() async {
    final response = await http.get(Uri.parse('$baseUrl/InvasiveSpecie'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      if (decoded is! List) {
        throw Exception('Formato inesperado: se esperaba una lista JSON');
      }

      return decoded
          .map((especie) => EspeciesInvasivasModel.fromJson(especie as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load especies invasivas');
    }
  }

  Future<EspeciesInvasivasModel> getEspecieInvasivaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/InvasiveSpecie/$id'));

    if (response.statusCode == 200) {
      return EspeciesInvasivasModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load especie invasiva');
    }
  }
}
