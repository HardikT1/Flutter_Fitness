import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mime/mime.dart';

import '../base_constants/base_colors.dart';
import '../base_constants/base_extensions.dart';
import '../base_constants/text_style.dart';

class CustomAuthTextFormField extends StatefulWidget {
  final String? errorText;
  final String? hintText;
  final TextStyle? style;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final String? prefixIcon;
  final bool? obscureText;
  final bool? hasPrefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final bool? hasObscureIcon;
  final bool? isReadOnly;
  final bool? showErrorText;
  final TextStyle? labelStyle;
  final bool? isRequiredField;
  final String? labelText;
  final void Function()? onTap;
  final bool? isPassword;
  final void Function(String)? onChange;

  const CustomAuthTextFormField(
      {super.key,
      this.errorText,
      this.textEditingController,
      this.validator,
      this.textInputAction = TextInputAction.next,
      this.maxLines = 1,
      this.maxLength,
      this.style,
      this.prefixIcon,
      this.hintText,
      this.obscureText = false,
      this.hasPrefixIcon = true,
      this.showErrorText = true,
      this.inputFormatters,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.hasObscureIcon = false,
      this.isReadOnly = false,
      this.labelStyle,
      this.isRequiredField = false,
      this.isPassword = false,
      this.labelText,
      this.onTap,
      this.onChange});

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  bool? isPassToggle = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.isRequiredField == true
            ? Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '${widget.labelText}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12),
                        children: [
                          TextSpan(
                              text: widget.isRequiredField == true ? ' *' : "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.1,
                                    fontSize: 13,
                                  ))
                        ]),
                  ),
                  5.toVSB,
                ],
              )
            : 0.toVSB,
        TextFormField(
          onTap: widget.onTap,
          textInputAction: widget.textInputAction,
          controller: widget.textEditingController,
          maxLength: widget.maxLength,
          obscureText: widget.isPassword! ? !isPassToggle! : false,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.isReadOnly! ? widget.isReadOnly! : false,
          maxLines: 1,
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: BaseTextStyles.textFieldStyle,
          onChanged: widget.onChange,
          decoration: InputDecoration(
            hintText: widget.hintText!,
            hintStyle: BaseTextStyles.textFieldHint,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 25,
            ),
            suffixIcon: widget.isPassword!
                ? IconButton(
                    icon: Icon(
                      !isPassToggle!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassToggle = !isPassToggle!;
                      });
                    },
                  )
                : widget.suffixIcon != null
                    ? IconButton(
                        icon: Icon(
                          widget.suffixIcon!,
                          color: BaseColors.secondaryGreyColor,
                        ),
                        onPressed: () {},
                      )
                    : null,
            prefixIcon: widget.prefixIcon != null
                ? lookupMimeType(widget.prefixIcon!)?.contains("svg") == true
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(widget.prefixIcon!),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          widget.prefixIcon!,
                          width: size.width * 0.06,
                          fit: BoxFit.fill,
                        ),
                      )
                : null,
            errorMaxLines: 2,
            counterText: "",
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
            isDense: true,
            filled: true,
            fillColor: BaseColors.borderColor,
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.prefixIcon != null ? 15 : 6.0,
                horizontal: 10.0),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(width: 1, color: BaseColors.borderColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(width: 1, color: BaseColors.borderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  const BorderSide(color: BaseColors.borderColor, width: 0.0),
            ),
          ),
          validator: widget.validator,
        ),
        10.toVSB,
      ],
    );
  }
}
