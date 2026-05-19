import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  //Instancia y referencia de la colección de universidades
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> _universidades;

  FirebaseService() {
    _universidades =
        _db.collection('universidades').withConverter<Map<String, dynamic>>(
              fromFirestore: (snap, _) => snap.data()!,
              toFirestore: (data, _) => data,
            );
  }
  //Metodo para obtener todas las universidades
  Future<List<Map<String, dynamic>>> getUniversidades() async {
    try {
      final snapshot = await _universidades.get();
      return snapshot.docs.map((doc) 
      {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener universidades: $e');
    }
  }
}
