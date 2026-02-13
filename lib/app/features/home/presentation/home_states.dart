import 'package:memories_app/app/features/home/domain/memories_model.dart';
import 'package:memories_app/app/features/home/presentation/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_states.g.dart';

@riverpod
class HomeMemoriesListState extends _$HomeMemoriesListState {
  @override
  List<MemoriesModel> build() {
    return initialize();
  }

  List<MemoriesModel> initialize() {
    return ref.read(homeStoreProvider).memoriesList;
  }

  void update() {
    state = initialize();
  }
}
