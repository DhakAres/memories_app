import 'package:memories_app/core/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
Future<void> splashLoader(Ref ref) async {
  await Future.delayed(Duration.zero);
  await ref.read(splashControllerProvider).initialize();
  return;
}

class SplashController {
  final Ref ref;
  SplashController(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    await ref.read(splashStoreProvider).initialize();
  }

  Future<void> checkAuthState() async {
    final router = ref.read(appRouterProvider);
    //final firebaseAuth = ref.read(firebaseAuthProvider); // ✅ Inyectado

    // Escuchar el estado de autenticación
    //final user = firebaseAuth.currentUser;

    // if (user != null) {
    //   // Usuario autenticado - obtener su rol
    //   final authRepository = ref.read(authRepositoryProvider);
    //   final userProfile = await authRepository.getUserProfile(user.uid);

    //   // Guardar datos en sesión
    //   await ref.read(authServiceProvider).registerAuth(user.uid);

    //   // Navegar según el rol
    //   if (userProfile.role == UserRole.admin.id) {
    //     router.go(AppRoutesNamed.adminHomeRoute);
    //   } else {
    //     router.go(AppRoutesNamed.clientHomeRoute);
    //   }
    // } else {
    // No hay usuario autenticado - ir al login
    router.go(AppRoutesNamed.homeRoute);
    //}
  }
}

class SplashStore {
  final Ref ref;
  SplashStore(this.ref);

  //Variables

  //Functions
  Future<void> initialize() async {
    // Delay para mostrar el splash por lo menos 2 segundos
    await Future.delayed(const Duration(seconds: 2));

    // Verificar estado de autenticación
    await ref.read(splashControllerProvider).checkAuthState();
  }
}

@riverpod
SplashController splashController(Ref ref) {
  return SplashController(ref);
}

@riverpod
SplashStore splashStore(Ref ref) {
  return SplashStore(ref);
}
