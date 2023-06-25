import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import 'authentication_provider.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
              print("okay");
            }
          }),
        ],
        child: SafeArea(
          child: Center(
            child: Theme(
              data: context.appTheme.copyWith(
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(24),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle?>(
                      context.textTheme.headlineSmall,
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
              child: Padding(
                padding: context.paddingNormal,
                child: firebase.LoginView(
                    action: firebase.AuthAction.signIn,
                    showTitle: false,
                    providers: firebase.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
