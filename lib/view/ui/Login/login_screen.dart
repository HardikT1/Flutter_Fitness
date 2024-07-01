import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/Dashboard/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../bloc/login_bloc/login_state.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/common_auth_bottom_section.dart';
import '../../../utils/common/common_auth_title.dart';
import 'login_components/login_form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => FlutterNativeSplash.remove());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => LoginFormBloc(GlobalKey<FormState>()),
        child: BlocBuilder<LoginFormBloc, LoginFormState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        50.toVSB,
                        const CommonAuthTitle(),
                        30.toVSB,
                        LoginFormFields(
                          logInFormKey: context.read<LoginFormBloc>().formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          onChangepassword: (_) {
                            context
                                .read<LoginFormBloc>()
                                .setPassword(passwordController.text);
                            return null;
                          },
                          onChangeemail: (_) {
                            context
                                .read<LoginFormBloc>()
                                .setEmail(emailController.text);
                            return null;
                          },
                        ),
                        const Spacer(),
                        CommonAuthBottomSection(
                          text: BaseStrings.dontHaveAccount,
                          boldText: BaseStrings.register,
                          buttonText: BaseStrings.login,
                          iconShow: true,
                          onTap: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pop();
                            },
                          buttonTap: () {
                            if (context
                                    .read<LoginFormBloc>()
                                    .formKey
                                    .currentState
                                    ?.validate() ==
                                true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen()),
                                  (r) => false);
                            }
                          },
                          buttonEnabled:
                              (context.read<LoginFormBloc>().validateEmail() ==
                                      true &&
                                  context
                                          .read<LoginFormBloc>()
                                          .validatePassword() ==
                                      true),
                        ),
                        50.toVSB,
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
