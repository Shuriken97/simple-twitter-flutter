import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Formfield Component
class SimpleTextField extends StatelessWidget {
  const SimpleTextField(
      {Key? key,
      this.controller,
      this.decoration,
      this.validator,
      this.minLines,
      this.maxLines,
      this.keyboardType,
      this.onChanged,
      this.initialValue,
      this.maxLength,
      this.autoFocus = false,
      this.enabling = true,
      this.obscureText = false,
      this.leading,
      this.bottomHelperText,
      this.hintText,
      this.labelText,
      this.style,
      this.trailing,
      this.inputFormatter,
      this.onFieldSubmitted,
      this.disableBorders = false,
      this.fillColor,
      this.focusNode,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.textCapitalization,
      this.leadingIcon,
      this.trailingIcon,
      this.disableErrorValidatorMessage = false,
      this.textInputAction,
      this.readonly = false,
      this.onTap})
      : super(key: key);

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? initialValue;
  final int? maxLength;
  final bool? autoFocus;
  final bool enabling;
  final bool obscureText;
  final Widget? leading;
  final String? bottomHelperText;
  final String? hintText;
  final String? labelText;
  final Widget? trailing;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onFieldSubmitted;
  final bool disableBorders;
  final bool disableErrorValidatorMessage;
  final Color? fillColor;
  final FocusNode? focusNode;
  final AutovalidateMode autovalidateMode;
  final TextCapitalization? textCapitalization;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final bool readonly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatter,
      enabled: enabling,
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      style: style,
      readOnly: readonly,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            labelText: labelText,
            helperText: bottomHelperText,
            hintText: hintText,
            errorMaxLines: 2,
            errorStyle: disableErrorValidatorMessage ? const TextStyle(height: 0) : const TextStyle(color: Colors.red),
            prefix: leading != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: leading,
                  )
                : null,
            suffix: trailing != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: trailing,
                  )
                : null,
            prefixIcon: leadingIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: leadingIcon,
                  )
                : null,
            suffixIcon: trailingIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: trailingIcon,
                  )
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            isDense: true,
            prefixIconConstraints: const BoxConstraints(minWidth: 0),
            suffixIconConstraints: const BoxConstraints(minWidth: 0),
            fillColor: fillColor,
            enabledBorder: disableBorders
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
            focusedBorder: disableBorders
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
            disabledBorder: disableBorders
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
            errorBorder: disableBorders
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
            focusedErrorBorder: disableBorders
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
          ),
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: keyboardType == TextInputType.multiline ? TextInputAction.newline : (textInputAction ?? TextInputAction.done),
      keyboardType: keyboardType,
      maxLength: maxLength,
      autofocus: autoFocus!,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
