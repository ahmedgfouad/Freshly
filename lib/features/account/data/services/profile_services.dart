import 'package:firebase_auth/firebase_auth.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class ProfileServices {
  Future<void> changePassword(String oldPassword , String newPassword);
}

class ProfileServicesImpl implements ProfileServices {
  User? user = AuthServicesImpl().currentUser;

  @override
  Future<void> changePassword(String oldPassword , String newPassword) async {
    if (user != null) {
      final cred = EmailAuthProvider.credential(
        email: user!.email.toString(),
        password: oldPassword,
      ); 
      await user!.reauthenticateWithCredential(cred); 
      await user!.updatePassword(newPassword);

    } 
  }
} 