import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/reservaIndigena.dart';

class ReservasIndigenasService {
  final String baseUrl = dotenv.env['API_URL']!;

  Future<List<ReservasIndigenasModel>> getReservasIndigenas() async {
    final response = await http.get(Uri.parse('$baseUrl/IndigenousReservation'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      if (decoded is! List) {
        throw Exception('Formato inesperado: se esperaba una lista JSON');
      }

      return decoded
          .map((reserva) => ReservasIndigenasModel.fromJson(reserva as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load reservas indígenas');
    }
  }

  Future<ReservasIndigenasModel> getReservaIndigenaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/IndigenousReservation/$id'));

    if (response.statusCode == 200) {
      return ReservasIndigenasModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load reserva indígena');
    }
  }
}
