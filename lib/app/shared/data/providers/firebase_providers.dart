import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

/// Provider centralizado para FirebaseAuth
/// Se usa en todos los repositorios que necesiten autenticación
// @Riverpod(keepAlive: true)
// FirebaseAuth firebaseAuth(Ref ref) {
//   return FirebaseAuth.instance;
// }

/// Provider centralizado para FirebaseFirestore
/// Se usa en todos los repositorios que necesiten acceso a la base de datos
@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}
