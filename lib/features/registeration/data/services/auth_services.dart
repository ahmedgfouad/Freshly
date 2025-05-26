import 'package:firebase_auth/firebase_auth.dart';
import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/registeration/data/models/user_model.dart';

abstract class AuthServices {
  User? get currentUser;

  Future<User?> lgoinWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> logout();
  Future<void> setUserData(UserModel userData);
}

class AuthServicesImpl implements AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  final firestor = FirestoreServices.instance;

  @override
  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<User?> lgoinWithEmailAndPassword(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<void> setUserData(UserModel userData) async => 
  await firestor.setData(
    path: ApiPath.user(userData.uid),
    data: userData.toMap(),
  );
}
