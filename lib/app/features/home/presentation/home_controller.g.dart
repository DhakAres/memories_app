// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeLoader)
const homeLoaderProvider = HomeLoaderProvider._();

final class HomeLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const HomeLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeLoaderHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return homeLoader(ref);
  }
}

String _$homeLoaderHash() => r'7d627311221147be6ef9dfd80669029d5b5d3cee';

@ProviderFor(homeController)
const homeControllerProvider = HomeControllerProvider._();

final class HomeControllerProvider
    extends $FunctionalProvider<HomeController, HomeController, HomeController>
    with $Provider<HomeController> {
  const HomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  $ProviderElement<HomeController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeController create(Ref ref) {
    return homeController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeController>(value),
    );
  }
}

String _$homeControllerHash() => r'e9cdf967d6c489f21401436c4ef3124e7c1ebc56';

@ProviderFor(homeStore)
const homeStoreProvider = HomeStoreProvider._();

final class HomeStoreProvider
    extends
        $FunctionalProvider<
          HomeControllerStore,
          HomeControllerStore,
          HomeControllerStore
        >
    with $Provider<HomeControllerStore> {
  const HomeStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeStoreHash();

  @$internal
  @override
  $ProviderElement<HomeControllerStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HomeControllerStore create(Ref ref) {
    return homeStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeControllerStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeControllerStore>(value),
    );
  }
}

String _$homeStoreHash() => r'12d2c663c95c99172f95d21f115a39ce8c4c20d1';
