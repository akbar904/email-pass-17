
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/screens/home_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('renders logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeScreen Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthStateUnauthenticated] when logout is called',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.logout(),
			expect: () => <AuthState>[AuthStateUnauthenticated()],
		);

		testWidgets('calls logout on AuthCubit when logout button is pressed', (WidgetTester tester) async {
			when(() => mockAuthCubit.logout()).thenAnswer((_) async => {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Logout'));
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
