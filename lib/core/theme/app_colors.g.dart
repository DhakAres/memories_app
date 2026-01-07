// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ColorsState)
const colorsStateProvider = ColorsStateProvider._();

final class ColorsStateProvider
    extends $NotifierProvider<ColorsState, Map<ColorsName, Color>> {
  const ColorsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorsStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorsStateHash();

  @$internal
  @override
  ColorsState create() => ColorsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<ColorsName, Color> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<ColorsName, Color>>(value),
    );
  }
}

String _$colorsStateHash() => r'bb746f46036025ce82b048f6211308cd7674dc89';

abstract class _$ColorsState extends $Notifier<Map<ColorsName, Color>> {
  Map<ColorsName, Color> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<Map<ColorsName, Color>, Map<ColorsName, Color>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<ColorsName, Color>, Map<ColorsName, Color>>,
              Map<ColorsName, Color>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
