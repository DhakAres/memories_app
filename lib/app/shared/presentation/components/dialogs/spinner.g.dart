// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spinner.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SpinnerState)
const spinnerStateProvider = SpinnerStateProvider._();

final class SpinnerStateProvider extends $NotifierProvider<SpinnerState, void> {
  const SpinnerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'spinnerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$spinnerStateHash();

  @$internal
  @override
  SpinnerState create() => SpinnerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$spinnerStateHash() => r'a010162cb46eb82cb74a69dc17c2b4eb3a2a424f';

abstract class _$SpinnerState extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
