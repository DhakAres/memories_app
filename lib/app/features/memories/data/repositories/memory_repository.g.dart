// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(memoryRepository)
const memoryRepositoryProvider = MemoryRepositoryProvider._();

final class MemoryRepositoryProvider
    extends
        $FunctionalProvider<
          IMemoryRepository,
          IMemoryRepository,
          IMemoryRepository
        >
    with $Provider<IMemoryRepository> {
  const MemoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<IMemoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IMemoryRepository create(Ref ref) {
    return memoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IMemoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IMemoryRepository>(value),
    );
  }
}

String _$memoryRepositoryHash() => r'236015a81e7c7212a528717c2f7361e144317862';
