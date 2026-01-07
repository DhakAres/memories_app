import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memories_app/app/shared/data/providers/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class IHomeRepository {}

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firebaseFirestore;

  // Constructor que recibe la dependencia inyectada
  HomeRepository({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore;
}

@Riverpod(keepAlive: true)
IHomeRepository homeRepository(Ref ref) {
  final firebaseFirestore = ref.watch(
    firebaseFirestoreProvider as ProviderListenable<FirebaseFirestore>,
  );
  return HomeRepository(firebaseFirestore: firebaseFirestore);
}
