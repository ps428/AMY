import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  // For registering a new user
  static Future<List> registerUsingEmailPassword(
      {required String name,
      required String email,
      required String password,
      required bool isDuplicateID}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        isDuplicateID = true;
      }
    } catch (e) {
      print(e);
    }

    return [user, isDuplicateID];
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        if (user.emailVerified) {
          print(user.displayName);
          print("verified section");
          print(user.emailVerified);
          return user;
        } else {
          print(user.displayName);
          print("unverified section");
          print(user.emailVerified);

          return null;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    print(user?.displayName);
    print(user?.emailVerified);
    print("yoo");

    return null;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
