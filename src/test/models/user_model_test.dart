
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/models/user_model.dart';

void main() {
	group('User Model Tests', () {
		test('User model should correctly serialize from JSON', () {
			// Arrange
			final Map<String, dynamic> json = {
				'email': 'test@example.com',
				'password': 'password123'
			};
			
			// Act
			final user = User.fromJson(json);
			
			// Assert
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
		
		test('User model should correctly deserialize to JSON', () {
			// Arrange
			final user = User(email: 'test@example.com', password: 'password123');
			
			// Act
			final json = user.toJson();
			
			// Assert
			expect(json, {
				'email': 'test@example.com',
				'password': 'password123'
			});
		});
		
		test('User model should have correct properties', () {
			// Arrange
			final user = User(email: 'test@example.com', password: 'password123');
			
			// Assert
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
