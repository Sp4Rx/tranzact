import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/cubits/signup/signup_cubit.dart';
import 'package:tranzact/repositories/auth_repository.dart';
import 'package:tranzact/ui/commons/atoms/default_app_bar.dart';
import 'package:tranzact/ui/commons/atoms/default_button.dart';
import 'package:tranzact/ui/commons/atoms/input_text.dart';
import 'package:tranzact/ui/commons/atoms/tranzact_logo_big.dart';
import 'package:tranzact/ui/commons/molecules/bottom_brands.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(context.read<AuthRepository>()),
          child: const SingleChildScrollView(
              padding: EdgeInsets.only(top: 60), child: SignupForm()),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.of(context).pop();
        } else if (state.status == SignupStatus.error) {
          // Nothing for now.
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TranzactLogoBig(),
          const SizedBox(height: 87),
          _EmailInput(),
          const SizedBox(height: 8),
          _PasswordInput(),
          const SizedBox(height: 8),
          _SignupButton(),
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
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputText(
          onChanged: (email) {
            context.read<SignupCubit>().emailChanged(email);
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
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputText(
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
          },
          label: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : DefaultButton(
                onPressed: () {
                  context.read<SignupCubit>().signupFormSubmitted();
                },
                text: 'Sign Up',
                isDisabled: false,
              );
      },
    );
  }
}
