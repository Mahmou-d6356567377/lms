import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUpRequested>((event, emit) async{
      emit(AuthLoading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
        emit(AuthSuccess(FirebaseAuth.instance.currentUser!));
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure( e.message ?? 'An error occurred'));
      } 
    });
  }
}
