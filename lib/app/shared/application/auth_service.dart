// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:raffle_fishing_app/app/features/auth/data/dtos/request_auth_dto.dart';
// import 'package:raffle_fishing_app/app/features/auth/data/repositories/auth_repository.dart';
// import 'package:raffle_fishing_app/app/features/auth/domain/auth_model.dart';
// import 'package:raffle_fishing_app/app/shared/domain/response_mutation_model.dart';
// import 'package:raffle_fishing_app/app/shared/domain/user_role.dart';
// import 'package:raffle_fishing_app/app/shared/presentation/states/session_data.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'auth_service.g.dart';

// class AuthService {
//   final Ref ref;

//   AuthService({required this.ref});

//   //Variables
//   late AuthModel data;

//   //Functions
//   Future<ResponseMutationModel<User?>> doAuth(RequestAuthDto dto) async {
//     // Mantenemos vivo el servicio mientras dure esta operación
//     //! Aqui es necesario porque no hay un UI que haga watch a este servicio
//     final link = ref.keepAlive();

//     try {
//       final repository = ref.read(authRepositoryProvider);
//       final response = await repository.signIn(dto);

//       if (response.success) {
//         data = await repository.getUserProfile(response.data!.uid);
//         writeUserDataSession();
//       }
//       return response;
//     } finally {
//       // Permitimos que el servicio muera si ya no se usa
//       link.close();
//     }
//   }

//   Future<void> registerAuth(String uid) async {
//     final link = ref.keepAlive();

//     try {
//       final repository = ref.read(authRepositoryProvider);
//       data = await repository.getUserProfile(uid);
//       if (data.uid.isNotEmpty) {
//         writeUserDataSession();
//       }
//     } finally {
//       link.close();
//     }
//   }

//   void writeUserDataSession() {
//     final sessionData = ref.read(sessionDataProvider);

//     sessionData.initialize(
//       userUid: data.uid,
//       userName: data.name,
//       userPhone: data.phone,
//       userEmail: data.email,
//       userRole: getUserRoleById(data.role),
//     );
//   }

//   Future<void> logout() async {
//     final sessionData = ref.read(sessionDataProvider);
//     sessionData.reset();
//     await ref.read(authRepositoryProvider).signOut();
//   }
// }

// @riverpod
// AuthService authService(Ref ref) {
//   return AuthService(ref: ref);
// }
