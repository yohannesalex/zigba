import 'package:bloc/bloc.dart';

import '../../Domain/useCases/login_usecase.dart';
import '../../Domain/useCases/signUp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final LoginUseCase _loginUseCase;

  AuthBloc(
    this._loginUseCase,
    this._signUpUseCase,
  ) : super(AuthInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _signUpUseCase(SignUpParams(user: event.user));
      result.fold((failure) {
        emit(AuthErrorState(message: failure.message));
      }, (data) {
        emit(SignUpSuccessState());
      });
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await _loginUseCase(LoginParams(user: event.user));

      result.fold((failure) {
        emit(AuthErrorState(message: failure.message));
      }, (data) {
        emit(LoginSuccessState());
      });
    });
  }
}
