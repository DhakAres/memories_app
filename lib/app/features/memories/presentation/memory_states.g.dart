// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_states.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Estado para las imágenes seleccionadas con lógica de selección incluida

@ProviderFor(SelectedImages)
const selectedImagesProvider = SelectedImagesProvider._();

/// Estado para las imágenes seleccionadas con lógica de selección incluida
final class SelectedImagesProvider
    extends $NotifierProvider<SelectedImages, List<File>> {
  /// Estado para las imágenes seleccionadas con lógica de selección incluida
  const SelectedImagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedImagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedImagesHash();

  @$internal
  @override
  SelectedImages create() => SelectedImages();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<File> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<File>>(value),
    );
  }
}

String _$selectedImagesHash() => r'1c21dceb1889ecdea4487b4ee11a4415c1eacd60';

/// Estado para las imágenes seleccionadas con lógica de selección incluida

abstract class _$SelectedImages extends $Notifier<List<File>> {
  List<File> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<File>, List<File>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<File>, List<File>>,
              List<File>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Estado para la descripción del recuerdo

@ProviderFor(MemoryDescription)
const memoryDescriptionProvider = MemoryDescriptionProvider._();

/// Estado para la descripción del recuerdo
final class MemoryDescriptionProvider
    extends $NotifierProvider<MemoryDescription, String> {
  /// Estado para la descripción del recuerdo
  const MemoryDescriptionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryDescriptionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryDescriptionHash();

  @$internal
  @override
  MemoryDescription create() => MemoryDescription();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$memoryDescriptionHash() => r'b8b156d4971e667d52ace5fbda262cc2c6795a4f';

/// Estado para la descripción del recuerdo

abstract class _$MemoryDescription extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
