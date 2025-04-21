import 'package:flutter/material.dart';
import 'package:sales_management/static/font.dart';
import 'package:sales_management/static/formatter.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
    this.hintText,
    this.labelText,
    this.prefixIcon, {
    this.isAutoFocusEnable = false,
    this.isPassword = false,
    this.enableValidator = false,
    this.validatorType = '',
    super.key,
  });

  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final bool isAutoFocusEnable;
  final bool isPassword;
  final bool enableValidator;
  final String validatorType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  // Function to validate email
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // No error
  }

  // Function to validate password
  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (value.length < 6) {
      return 'Username must be at least 6 characters long';
    }
    return null; // No error
  }

  // Function to validate password
  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // No error
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005,
        ),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          maxLines: 1,
          autofocus: widget.isAutoFocusEnable,
          inputFormatters: [Formatter.normalFormatter],
          textCapitalization: TextCapitalization.none,
          controller: controller,
          enabled: true,
          obscureText: widget.isPassword,
          style: FontStyle.textfieldPlaceholder,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white54,
            contentPadding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            hintStyle: FontStyle.textfieldPlaceholder,
            hintText: 'Enter ${widget.hintText}',
            labelText: widget.labelText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            prefixIcon: widget.prefixIcon,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:
              widget.enableValidator
                  ? (() {
                    switch (widget.validatorType) {
                      case 'email':
                        return emailValidation;
                      case 'username':
                        return usernameValidator;
                      case 'password':
                        return passwordValidation;
                      default:
                        return null;
                    }
                  })()
                  : null,
          onChanged: (newValues) {},
        ),
      ),
    );
  }
}
