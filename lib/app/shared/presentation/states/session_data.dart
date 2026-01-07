// import 'package:raffle_fishing_app/app/shared/domain/user_role.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'session_data.g.dart';

// class SessionData {
//   String _userUid = "";
//   String _userName = "";
//   String _userPhone = "";
//   String _userEmail = "";
//   UserRole _userRole = UserRole.client;

//   SessionData();

//   void initialize({
//     required String userUid,
//     required String userName,
//     required String userPhone,
//     required String userEmail,
//     required UserRole userRole,
//   }) {
//     reset();
//     _userUid = userUid;
//     _userName = userName;
//     _userPhone = userPhone;
//     _userEmail = userEmail;
//     _userRole = userRole;
//   }

//   void reset() {
//     _userUid = "";
//     _userName = "";
//     _userPhone = "";
//     _userEmail = "";
//     _userRole = UserRole.client;
//   }

//   String get userUid => _userUid;
//   String get userName => _userName;
//   String get userPhone => _userPhone;
//   String get userEmail => _userEmail;
//   UserRole get userRole => _userRole;
// }

// @Riverpod(keepAlive: true)
// SessionData sessionData(Ref ref) {
//   return SessionData();
// }
