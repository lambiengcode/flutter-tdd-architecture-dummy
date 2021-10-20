import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_architecture/src/di/injection_container.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/presentation/screens/home_screen.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter_tdd_architecture/src/features/common/screens/loading_screen.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devideType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TDD Architecture',
          home: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => sl<AuthBloc>()..add(OnAuthCheck()),
              ),
            ],
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthenticationSuccess) {
                  return state.userModel != null ? HomeScreen() : LoginScreen();
                }

                return LoadingScreen();
              },
            ),
          ),
        );
      },
    );
  }
}
