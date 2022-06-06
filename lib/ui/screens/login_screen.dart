import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/cubits/login/login_cubit.dart';
import 'package:tranzact/repositories/auth_repository.dart';
import 'package:tranzact/ui/commons/atoms/blue_text.dart';
import 'package:tranzact/ui/commons/atoms/default_button.dart';
import 'package:tranzact/ui/commons/atoms/google_button.dart';
import 'package:tranzact/ui/commons/atoms/input_text.dart';
import 'package:tranzact/ui/commons/atoms/tranzact_logo_big.dart';
import 'package:tranzact/ui/commons/molecules/bottom_brands.dart';
import 'package:tranzact/ui/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthRepository>()),
          child: const Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 60),
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          //Noting for now
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TranzactLogoBig(),
          const SizedBox(height: 87),
          _EmailInput(),
          const SizedBox(height: 33),
          _PasswordInput(),
          const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: BlueText('Forgot password?'),
              )),
          const SizedBox(height: 28),
          _LoginButton(),
          const SizedBox(height: 24),
          GoogleButton(
            text: 'Sign In with Gmail',
            onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
          ),
          const SizedBox(height: 20),
          Wrap(
            children: [
              const Text('Don’t have an account?  '),
              BlueText(
                'Sign Up',
                onPressed: () =>
                    Navigator.of(context).push<void>(SignupScreen.route()),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const BottomBrands(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputText(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          label: 'Email',
          hintText: 'Enter your email address',
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputText(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          label: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : DefaultButton(
                onPressed: () {
                  context.read<LoginCubit>().logInWithCredentials();
                },
                text: 'Sign In',
                isDisabled: false,
              );
      },
    );
  }
}
