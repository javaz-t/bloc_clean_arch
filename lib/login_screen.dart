import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/bloc/auth_bloc.dart';
import 'package:learn_bloc_clean/widgets/gradient_button.dart';
import 'package:learn_bloc_clean/widgets/login_field.dart';
import 'package:learn_bloc_clean/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>( //consumer = builder + listener
        listener: (context, state) {
          if (state is AuthFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Warning"),
                  content: Text(state.error),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          } else if (state is AuthSuccess) {
            Navigator.pushNamed(context, '/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 15),
                  const Text('or', style: TextStyle(fontSize: 17)),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    onTap: () {
                      context.read<AuthBloc>().add(
                        LoginRequestEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
