import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/tiposAreaNatural.dart';


class AreaNaturalService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<List<AreaNaturalModel>> getAreasNaturales() async {
    final response = await http.get(Uri.parse('$baseUrl/CategoryNaturalArea'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      if (decoded is! List) {
        throw Exception('Formato inesperado: se esperaba una lista JSON');
      }

      return decoded
          .map((area) => AreaNaturalModel.fromJson(area as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load areas naturales');
    }
  }

  Future<AreaNaturalModel> getAreaNaturalById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/CategoryNaturalArea/$id'));

    if (response.statusCode == 200) {
      return AreaNaturalModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load area natural');
    }
  }
}