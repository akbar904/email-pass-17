
import 'dart:convert';

class User {
	final String email;
	final String password;

	User({required this.email, required this.password});

	// Factory constructor for creating a User instance from JSON.
	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			email: json['email'] as String,
			password: json['password'] as String,
		);
	}

	// Method to convert a User instance to JSON.
	Map<String, dynamic> toJson() {
		return {
			'email': email,
			'password': password,
		};
	}
}
