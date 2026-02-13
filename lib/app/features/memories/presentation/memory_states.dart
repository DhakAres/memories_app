import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_states.g.dart';

/// Estado para las imágenes seleccionadas con lógica de selección incluida
@riverpod
class SelectedImages extends _$SelectedImages {
  final ImagePicker _picker = ImagePicker();

  @override
  List<File> build() {
    return [];
  }

  // Métodos para manipular el estado
  void addImage(File image) {
    state = [...state, image];
  }

  void addImages(List<File> images) {
    state = [...state, ...images];
  }

  void removeImage(int index) {
    state = [...state]..removeAt(index);
  }

  void clear() {
    state = [];
  }

  // Lógica de selección de imágenes
  Future<void> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (image != null) {
        addImage(File(image.path));
      }
    } catch (e) {
      // Propagar error para manejarlo en UI si es necesario
      rethrow;
    }
  }

  Future<void> pickFromGallery() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (images.isNotEmpty) {
        final files = images.map((xFile) => File(xFile.path)).toList();
        addImages(files);
      }
    } catch (e) {
      // Propagar error para manejarlo en UI si es necesario
      rethrow;
    }
  }
}

/// Estado para la descripción del recuerdo
@riverpod
class MemoryDescription extends _$MemoryDescription {
  @override
  String build() {
    return '';
  }

  void updateDescription(String description) {
    state = description;
  }

  void clear() {
    state = '';
  }
}
