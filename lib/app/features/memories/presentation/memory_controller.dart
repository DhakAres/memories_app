import 'package:memories_app/app/features/home/presentation/home_controller.dart';
import 'package:memories_app/app/features/memories/data/repositories/memory_repository.dart';
import 'package:memories_app/app/features/memories/presentation/memory_states.dart';
import 'package:memories_app/app/shared/domain/response_mutation_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_controller.g.dart';

@riverpod
Future<void> memoryLoader(Ref ref) async {
  await Future.delayed(Duration.zero);
  await ref.read(memoryControllerProvider).initialize();
  return;
}

class MemoryController {
  final Ref ref;
  MemoryController(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    await ref.read(memoryStoreProvider).initialize();
  }

  /// Ejecuta el proceso completo: subir imágenes y guardar recuerdo
  Future<ResponseMutationModel<void>> executeRegistration() async {
    final repository = ref.read(memoryRepositoryProvider);
    final images = ref.read(selectedImagesProvider);
    final description = ref.read(memoryDescriptionProvider);

    // 1. Subir imágenes a Storage
    final uploadResponse = await repository.uploadImages(images);

    if (!uploadResponse.success || uploadResponse.data == null) {
      return ResponseMutationModel(
        message: uploadResponse.message,
        success: false,
      );
    }

    // 2. Guardar recuerdo en Firestore con las URLs
    final imageUrls = uploadResponse.data!;
    final saveResponse = await repository.saveMemory(
      imageUrls: imageUrls,
      description: description,
    );

    if (saveResponse.success) {
      // Limpiar estado después de guardar exitosamente
      ref.read(selectedImagesProvider.notifier).clear();
      ref.read(memoryDescriptionProvider.notifier).clear();
      ref.read(homeControllerProvider).updateInbox();
    }

    return saveResponse;
  }
}

class MemoryStore {
  final Ref ref;
  MemoryStore(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    return;
  }
}

@riverpod
MemoryController memoryController(Ref ref) {
  return MemoryController(ref);
}

@riverpod
MemoryStore memoryStore(Ref ref) {
  return MemoryStore(ref);
}
