import 'package:memories_app/app/features/home/data/repositories/home_repository.dart';
import 'package:memories_app/app/features/home/domain/memories_model.dart';
import 'package:memories_app/app/features/home/presentation/home_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
Future<void> homeLoader(Ref ref) async {
  await Future.delayed(Duration.zero);
  await ref.read(homeControllerProvider).initialize();
  return;
}

class HomeController {
  final Ref ref;
  HomeController(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    await ref.read(homeStoreProvider).initialize();
  }

  Future<void> updateInbox() async {
    await ref.read(homeStoreProvider).initialize();
    ref.read(homeMemoriesListStateProvider.notifier).update();
  }
}

class HomeControllerStore {
  final Ref ref;
  HomeControllerStore(this.ref);

  //Variables
  List<MemoriesModel> memoriesList = [];

  //Functions
  Future<void> initialize() async {
    await Future.wait([getMemories()]);
    return;
  }

  Future<void> getMemories() async {
    final repository = ref.read(homeRepositoryProvider);
    memoriesList = await repository.getMemories();
  }
}

@riverpod
HomeController homeController(Ref ref) {
  return HomeController(ref);
}

@riverpod
HomeControllerStore homeStore(Ref ref) {
  return HomeControllerStore(ref);
}
