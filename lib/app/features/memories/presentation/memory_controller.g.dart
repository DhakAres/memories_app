// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(memoryLoader)
const memoryLoaderProvider = MemoryLoaderProvider._();

final class MemoryLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const MemoryLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryLoaderHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return memoryLoader(ref);
  }
}

String _$memoryLoaderHash() => r'03ac8d5cea1f64fd1dedd76bee253b8f0dd3a4d1';

@ProviderFor(memoryController)
const memoryControllerProvider = MemoryControllerProvider._();

final class MemoryControllerProvider
    extends
        $FunctionalProvider<
          MemoryController,
          MemoryController,
          MemoryController
        >
    with $Provider<MemoryController> {
  const MemoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryControllerHash();

  @$internal
  @override
  $ProviderElement<MemoryController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MemoryController create(Ref ref) {
    return memoryController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MemoryController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MemoryController>(value),
    );
  }
}

String _$memoryControllerHash() => r'07b6f4a4b345ecf881063df58c63c29f522a1ba1';

@ProviderFor(memoryStore)
const memoryStoreProvider = MemoryStoreProvider._();

final class MemoryStoreProvider
    extends $FunctionalProvider<MemoryStore, MemoryStore, MemoryStore>
    with $Provider<MemoryStore> {
  const MemoryStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryStoreHash();

  @$internal
  @override
  $ProviderElement<MemoryStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MemoryStore create(Ref ref) {
    return memoryStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MemoryStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MemoryStore>(value),
    );
  }
}

String _$memoryStoreHash() => r'2982bf8e2019f97f7ebfcd2299b2c6d46dd47fe2';
