import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/app/features/splash/presentation/splash_controller.dart';
import 'package:memories_app/app/features/splash/presentation/widgets/splash_content.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashControllerProvider);
    ref.watch(splashStoreProvider);
    final loaderState = ref.watch(splashLoaderProvider);

    return Scaffold(
      body: loaderState.when(
        data: (_) {
          return const SplashContent();
        },
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: SplashContent()),
      ),
    );
  }
}
