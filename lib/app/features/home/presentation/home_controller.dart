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
}

class HomeControllerStore {
  final Ref ref;
  HomeControllerStore(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    return;
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
