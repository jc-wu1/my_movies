import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies/core/resources/app_values.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/router/app_routes.dart';
import '../../authentication/bloc/authentication_cubit.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        context.read<AuthenticationCubit>(),
      ),
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  bool visibility = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Login',
        ),
        foregroundColor: AppColors.primaryBtnText,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: IntrinsicHeight(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 1.2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: AppSize.s14,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                15.0,
                                10.0,
                                15.0,
                                10.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            validator: (string) {
                              if (string == null || string == "") {
                                return "Username is required!";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibility = !visibility;
                                  });
                                },
                                icon: Icon(
                                  visibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.fromLTRB(
                                15.0,
                                10.0,
                                15.0,
                                10.0,
                              ),
                              hintStyle: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: AppSize.s14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            validator: (string) {
                              if (string == null || string == "") {
                                return "Password is required!";
                              }
                              return null;
                            },
                            obscureText: visibility,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          BlocListener<LoginBloc, LoginState>(
                            listener: (_, state) {
                              if (state is LoginLoading) {
                                showDialog(
                                  useRootNavigator: true,
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (ctx) => const AlertDialog.adaptive(
                                    icon: Icon(Icons.warning_amber),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator.adaptive(
                                          backgroundColor: AppColors.primary,
                                        ),
                                        Text(
                                          'Authenticating...',
                                          style: TextStyle(
                                            color: AppColors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } else if (state is LoginFailure) {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                if (state.errorModel.statusCode == 400) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog.adaptive(
                                      icon: const Icon(Icons.warning_amber),
                                      content: Text(
                                        state.errorModel.statusMessage,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            foregroundColor: Colors.white,
                                          ),
                                          child: const Text(
                                            'Back',
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              } else if (state is LoginSucceed) {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                _logginUser(context);
                              }
                            },
                            child: SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.primaryBtnText,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {
                                  _onTapButtonLogin(context);
                                },
                                child: const Text(
                                  'Login',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.primaryBtnText,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                context.goNamed(AppRoutes.moviesRoute);
                              },
                              child: const Text(
                                'Guest Login',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logginUser(BuildContext context) {
    context.goNamed(AppRoutes.moviesRoute);
  }

  void _onTapButtonLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // final String email = fields!["email"];
      // final String password = fields["password"];

      context.read<LoginBloc>().add(
            LoginUserEvent(
              _usernameController.value.text,
              _passwordController.value.text,
            ),
          );
    }
  }
}
