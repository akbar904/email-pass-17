
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('App should show LoginScreen initially', (tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('AuthCubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [AuthLoading(), AuthAuthenticated(User(email: 'test@example.com'))],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthUnauthenticated] when logout is successful',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthLoading(), AuthUnauthenticated()],
		);
	});
}
