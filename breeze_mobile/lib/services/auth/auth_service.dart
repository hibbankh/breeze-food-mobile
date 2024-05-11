import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception("Failed to create user: ${e.message}");
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception("Failed to sent reset password email: ${e.message}");
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    User? user = _firebaseAuth.currentUser;
    String email = user!.email!;

    // Re-authenticate user
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // If re-authentication is successful, proceed to change the password
      await user.updatePassword(newPassword);
      print("Password changed successfully.");
    } on FirebaseAuthException catch (e) {
      print("Error changing password: ${e.message}");
      throw Exception(e.message);
    }
  }
}
