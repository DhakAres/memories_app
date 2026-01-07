import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/app/features/home/presentation/home_controller.dart';
import 'package:memories_app/app/features/home/presentation/widgets/home_content.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/loading_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeControllerProvider);
    ref.watch(homeStoreProvider);
    final loaderState = ref.watch(homeLoaderProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: loaderState.when(
          data: (_) {
            return const HomeContent();
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: LoadingWidget()),
        ),
      ),
    );
  }
}
