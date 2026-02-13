import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memories_app/app/shared/data/providers/firebase_providers.dart';
import 'package:memories_app/app/shared/domain/response_mutation_model.dart';
import 'package:memories_app/core/network/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_repository.g.dart';

abstract class IMemoryRepository {
  Future<ResponseMutationModel<List<String>>> uploadImages(List<File> images);
  Future<ResponseMutationModel<void>> saveMemory({
    required List<String> imageUrls,
    required String description,
  });
}

class MemoryRepository implements IMemoryRepository {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;

  MemoryRepository({
    required FirebaseStorage firebaseStorage,
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseStorage = firebaseStorage,
       _firebaseFirestore = firebaseFirestore;

  @override
  Future<ResponseMutationModel<List<String>>> uploadImages(
    List<File> images,
  ) async {
    try {
      appLogger.i(
        '📤 STORAGE REQUEST: Upload ${images.length} images to Firebase Storage',
      );

      final List<String> downloadUrls = [];
      final storageRef = _firebaseStorage.ref();

      // Timestamp único para todas las imágenes del mismo recuerdo
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      for (int i = 0; i < images.length; i++) {
        final file = images[i];
        final fileName = 'memory_${timestamp}_$i.jpg';

        // Ruta: memories/{timestamp}/{nombre_archivo}
        final imageRef = storageRef.child('memories/$timestamp/$fileName');

        // Subir el archivo (File se usa directamente)
        final uploadTask = await imageRef.putFile(
          file,
          SettableMetadata(
            contentType: 'image/jpeg',
            customMetadata: {'uploadedAt': timestamp.toString()},
          ),
        );

        // Obtener la URL de descarga
        final downloadUrl = await uploadTask.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }

      appLogger.i(
        '✅ STORAGE SUCCESS: ${downloadUrls.length} images uploaded successfully',
      );
      return ResponseMutationModel(
        message: '${downloadUrls.length} imagen(es) subida(s) correctamente',
        success: true,
        data: downloadUrls,
      );
    } on FirebaseException catch (e) {
      appLogger.e('❌ STORAGE ERROR: Upload images', error: e);
      return ResponseMutationModel(
        message: 'Error de Firebase: ${e.message ?? e.code}',
        success: false,
      );
    } catch (e) {
      appLogger.e('❌ ERROR: Upload images', error: e);
      return ResponseMutationModel(
        message: 'Error al subir imágenes: $e',
        success: false,
      );
    }
  }

  @override
  Future<ResponseMutationModel<void>> saveMemory({
    required List<String> imageUrls,
    required String description,
  }) async {
    try {
      appLogger.i(
        '📝 FIRESTORE REQUEST: Save memory with ${imageUrls.length} images to /memories',
      );

      final memoriesRef = _firebaseFirestore.collection('memories');
      final timestamp = FieldValue.serverTimestamp();

      // Crear documento del recuerdo
      await memoriesRef.add({
        'imageUrls': imageUrls,
        'description': description.trim(),
        'createdAt': timestamp,
        'updatedAt': timestamp,
        'imageCount': imageUrls.length,
        // TODO: Agregar userId cuando implementes autenticación
        // 'userId': currentUserId,
      });

      appLogger.i('✅ FIRESTORE SUCCESS: Memory saved successfully');
      return ResponseMutationModel(
        message: 'Recuerdo guardado exitosamente',
        success: true,
      );
    } on FirebaseException catch (e) {
      appLogger.e('❌ FIRESTORE ERROR: Save memory', error: e);
      return ResponseMutationModel(
        message: 'Error de Firebase: ${e.message ?? e.code}',
        success: false,
      );
    } catch (e) {
      appLogger.e('❌ ERROR: Save memory', error: e);
      return ResponseMutationModel(
        message: 'Error al guardar recuerdo: $e',
        success: false,
      );
    }
  }
}

@Riverpod(keepAlive: true)
IMemoryRepository memoryRepository(Ref ref) {
  final firebaseStorage = ref.watch(
    firebaseStorageProvider as ProviderListenable<FirebaseStorage>,
  );
  final firebaseFirestore = ref.watch(
    firebaseFirestoreProvider as ProviderListenable<FirebaseFirestore>,
  );
  return MemoryRepository(
    firebaseStorage: firebaseStorage,
    firebaseFirestore: firebaseFirestore,
  );
}
