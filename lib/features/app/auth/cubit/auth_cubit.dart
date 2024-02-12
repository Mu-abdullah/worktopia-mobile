import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> auth({required String mail, required String password}) async {
    try {
      emit(LoadingAuth());

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
      emit(SuccessAuth());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FException(e.code.toString()));
      } else if (e.code == 'email-already-in-use') {
        emit(FException(e.code.toString()));
      }
    } catch (e) {
      emit(FailedAuth(e.toString()));
    }
  }
}
