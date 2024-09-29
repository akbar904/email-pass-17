
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/models/user_model.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
	final User user;
	AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
	final String error;
	AuthError(this.error);
}

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate a network request
			await Future.delayed(Duration(seconds: 2));
			if (email == 'test@example.com' && password == 'password') {
				emit(AuthAuthenticated(User(email: email)));
			} else {
				emit(AuthError('Login failed'));
			}
		} catch (e) {
			emit(AuthError('An error occurred'));
		}
	}

	void logout() {
		emit(AuthUnauthenticated());
	}
}
