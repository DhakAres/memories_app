// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashLoader)
const splashLoaderProvider = SplashLoaderProvider._();

final class SplashLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SplashLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashLoaderHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return splashLoader(ref);
  }
}

String _$splashLoaderHash() => r'894d928cf94b7ddeeac6513dfe5b2670881c780c';

@ProviderFor(splashController)
const splashControllerProvider = SplashControllerProvider._();

final class SplashControllerProvider
    extends
        $FunctionalProvider<
          SplashController,
          SplashController,
          SplashController
        >
    with $Provider<SplashController> {
  const SplashControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  $ProviderElement<SplashController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashController create(Ref ref) {
    return splashController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashController>(value),
    );
  }
}

String _$splashControllerHash() => r'ba642102801477e06c91753925c0c30ec35909ad';

@ProviderFor(splashStore)
const splashStoreProvider = SplashStoreProvider._();

final class SplashStoreProvider
    extends $FunctionalProvider<SplashStore, SplashStore, SplashStore>
    with $Provider<SplashStore> {
  const SplashStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashStoreHash();

  @$internal
  @override
  $ProviderElement<SplashStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashStore create(Ref ref) {
    return splashStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashStore>(value),
    );
  }
}

String _$splashStoreHash() => r'c5bb90c44a4b2059108c268133c985c05b673f00';
