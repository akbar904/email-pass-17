
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						TextField(
							key: Key('emailField'),
							controller: _emailController,
							decoration: InputDecoration(
								labelText: 'Email',
							),
						),
						TextField(
							key: Key('passwordField'),
							controller: _passwordController,
							obscureText: true,
							decoration: InputDecoration(
								labelText: 'Password',
							),
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								final email = _emailController.text;
								final password = _passwordController.text;
								context.read<AuthCubit>().login(email, password);
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}
