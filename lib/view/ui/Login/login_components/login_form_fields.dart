import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class LoginFormFields extends StatefulWidget {
  final GlobalKey? logInFormKey;
  final TextEditingController? emailController;

  final TextEditingController? passwordController;
  final Function(String)? onChangepassword;
  final Function(String)? onChangeemail;

  const LoginFormFields(
      {super.key,
      this.logInFormKey,
      this.emailController,
      this.passwordController,
      this.onChangeemail,
      this.onChangepassword});

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.logInFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAuthTextFormField(
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            hasPrefixIcon: true,
            textEditingController: widget.emailController,
            validator: (value) => validators.validateEmail(value!),
            onChange: widget.onChangeemail,
          ),
          15.toVSB,
          CustomAuthTextFormField(
            hintText: BaseStrings.password,
            prefixIcon: BaseAssets.passwordIcon,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            maxLines: 1,
            obscureText: true,
            isPassword: true,
            hasPrefixIcon: true,
            textEditingController: widget.passwordController,
            validator: (value) => validators.validatePassword(value!),
            onChange: widget.onChangepassword,
          ),
          const Center(
            child: TextView(BaseStrings.forgotYourPassword,
                textStyle: BaseTextStyles.textUnderLine),
          )
        ],
      ),
    );
  }
}
