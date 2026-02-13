import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/app/features/memories/presentation/memory_controller.dart';
import 'package:memories_app/app/features/memories/presentation/widgets/memory_content.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/loading_widget.dart';

class MemoryView extends ConsumerWidget {
  const MemoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(memoryControllerProvider);
    ref.watch(memoryStoreProvider);
    final loaderState = ref.watch(memoryLoaderProvider);

    return Scaffold(
      body: SafeArea(
        child: loaderState.when(
          data: (_) {
            return const MemoryContent();
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: LoadingWidget()),
        ),
      ),
    );
  }
}
