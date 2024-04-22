import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindhub/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class FunctionFirebase {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final User? user = auth.currentUser;
  static final FirebaseAuthService authFirebaseAuthService =
      FirebaseAuthService();
}
