import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memories_app/app/features/home/data/dtos/response_memories_dto.dart';
import 'package:memories_app/app/features/home/domain/memories_model.dart';
import 'package:memories_app/app/shared/data/providers/firebase_providers.dart';
import 'package:memories_app/core/network/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

abstract class IHomeRepository {
  Future<List<MemoriesModel>> getMemories();
}

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firebaseFirestore;

  // Constructor que recibe la dependencia inyectada
  HomeRepository({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<MemoriesModel>> getMemories() async {
    try {
      appLogger.i('📖 FIRESTORE REQUEST: Get all memories from /memories');

      // Obtener todos los documentos de la colección 'memories'
      // Ordenados por fecha de creación (más recientes primero)
      final querySnapshot =
          await _firebaseFirestore
              .collection('memories')
              .orderBy('createdAt', descending: true)
              .get();

      // Mapear cada documento a MemoriesModel
      final memories =
          querySnapshot.docs.map((doc) {
            // Obtener los datos del documento
            final data = doc.data();

            // Agregar el ID del documento al mapa de datos
            data['uid'] = doc.id;

            // Convertir a DTO y luego a Model
            final dto = ResponseMemoriesDto.fromJson(data);
            return dto.toModel();
          }).toList();

      appLogger.i('✅ FIRESTORE SUCCESS: Retrieved ${memories.length} memories');
      return memories;
    } on FirebaseException catch (e) {
      // Error específico de Firebase
      appLogger.e('❌ FIRESTORE ERROR: Get memories', error: e);
      return [];
    } catch (e) {
      // Error general
      appLogger.e('❌ ERROR: Get memories', error: e);
      return [];
    }
  }
}

@Riverpod(keepAlive: true)
IHomeRepository homeRepository(Ref ref) {
  final firebaseFirestore = ref.watch(
    firebaseFirestoreProvider as ProviderListenable<FirebaseFirestore>,
  );
  return HomeRepository(firebaseFirestore: firebaseFirestore);
}
