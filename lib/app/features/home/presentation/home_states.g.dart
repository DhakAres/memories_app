// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_states.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeMemoriesListState)
const homeMemoriesListStateProvider = HomeMemoriesListStateProvider._();

final class HomeMemoriesListStateProvider
    extends $NotifierProvider<HomeMemoriesListState, List<MemoriesModel>> {
  const HomeMemoriesListStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeMemoriesListStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeMemoriesListStateHash();

  @$internal
  @override
  HomeMemoriesListState create() => HomeMemoriesListState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MemoriesModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MemoriesModel>>(value),
    );
  }
}

String _$homeMemoriesListStateHash() =>
    r'15efc5ca8e628df9e71905b273c2745a1850d2f1';

abstract class _$HomeMemoriesListState extends $Notifier<List<MemoriesModel>> {
  List<MemoriesModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<MemoriesModel>, List<MemoriesModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<MemoriesModel>, List<MemoriesModel>>,
              List<MemoriesModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
