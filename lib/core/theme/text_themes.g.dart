// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_themes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appTextStyles)
const appTextStylesProvider = AppTextStylesProvider._();

final class AppTextStylesProvider
    extends $FunctionalProvider<AppTextStyles, AppTextStyles, AppTextStyles>
    with $Provider<AppTextStyles> {
  const AppTextStylesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appTextStylesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appTextStylesHash();

  @$internal
  @override
  $ProviderElement<AppTextStyles> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTextStyles create(Ref ref) {
    return appTextStyles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTextStyles value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTextStyles>(value),
    );
  }
}

String _$appTextStylesHash() => r'2f03aaeca53d6b18a32a0f64b60cf0d2f932e62d';
