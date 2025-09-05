import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/bloc/auth_bloc.dart';
import 'package:learn_bloc_clean/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
/*    final authStae =
        context.watch<AuthBloc>().state
            as AuthSuccess; *///rebuild entire thing when change happen , can use bloc builder
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false, // remove all previous routes
            );

          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if(state is AuthSuccess){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text( state.message)),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequestEvent());
                  },
                  child: Text('Sign Out'),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
