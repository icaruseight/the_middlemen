import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class BlueTextFormField extends StatelessWidget {
  BlueTextFormField({
      required this.hintText,required this.icon,required this.controller,required this.validator});

  final controller;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: kStyleFocused,
          enabledBorder: kStyleEnabled,
          errorBorder: kStyleError,
          focusedErrorBorder: kStyleFocusedError,
          hintText: hintText,
          hintStyle: kStyleHintStyle,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              icon,
              size: 22,
              color: kStyleAppColor,
            ),
          )),
    );
  }
}

class WeightFormField extends StatelessWidget {
  WeightFormField({
    required this.hintText,required this.icon,required this.controller,required this.validator});

  final controller;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      controller: controller,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: kStyleFocused,
          disabledBorder: kStyleEnabled,
          errorBorder: kStyleError,
          focusedErrorBorder: kStyleFocusedError,
          hintText: hintText,
          hintStyle: kStyleHintStyle,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              icon,
              size: 22,
              color: kStyleAppColor,
            ),
          )),
    );
  }
}

class TrackingFormField extends StatelessWidget {
  TrackingFormField(
      this.hintText, this.icon, this.nameController, this.validator);

  final nameController;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: kStyleFocused,
          enabledBorder: kStyleEnabled,
          errorBorder: kStyleError,
          focusedErrorBorder: kStyleFocusedError,
          hintText: hintText,
          hintStyle: kStyleHintStyle,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              icon,
              size: 22,
              color: Colors.black,
            ),
          )),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {

  const PasswordTextFormField({
    Key? key,
    required this.passController,
    required this.isHiddenPassword,
    required this.icon

  }) : super(key: key);


  final TextEditingController passController;
  final isHiddenPassword;
  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passController,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        filled: true,
        focusedBorder: kStyleFocused,
        enabledBorder: kStyleEnabled,
        errorBorder: kStyleError,
        focusedErrorBorder: kStyleFocusedError,
        hintText: 'Password',
        hintStyle: kStyleHintStyle,
        contentPadding:
        const EdgeInsets.fromLTRB(8, 16, 0, 0),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(
              left: 20, right: 12),
          child: Icon(Icons.lock_outlined,color: kStyleAppColor,),
        ),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 17),
            child: icon
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
    );
  }
}

class BlueTextFormFieldPN extends StatelessWidget {
  BlueTextFormFieldPN(
      this.hintText, this.icon, this.nameController, this.validator);

  final nameController;
  final hintText;
  final icon;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      controller: nameController,
      validator: validator,
      autocorrect: false,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        fontFamily: 'NutinoSansReg',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          focusedBorder: kStyleFocused,
          enabledBorder: kStyleEnabled,
          errorBorder: kStyleError,
          focusedErrorBorder: kStyleFocusedError,
          hintText: hintText,
          hintStyle: kStyleHintStyle,
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Image.asset(
              icon,
              width: 20,
              color: kStyleAppColor,
            ),
          )),
    );
  }
}

class SignUpPass extends StatelessWidget {
  const SignUpPass({
    Key? key,
    required this.passwordController,
    required this.isHiddenPassword,
    required this.isConfirmHiddenPassword,
    required this.onPress
  }) : super(key: key);

  final TextEditingController passwordController;
  final bool isHiddenPassword;
  final bool isConfirmHiddenPassword;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      style: const TextStyle(
        fontFamily: 'NutinoSansReg',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        filled: true,
        focusedBorder: kStyleFocused,
        enabledBorder: kStyleEnabled,
        errorBorder: kStyleError,
        focusedErrorBorder: kStyleFocusedError,
        hintText: 'Password',
        hintStyle: kStyleHintStyle,
        contentPadding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 12),
          child: Image.asset(
            'assets/SignUp/lock.png',
            width: 20,
            color: kStyleAppColor,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 17),
          child: InkWell(
            onTap: onPress,
            child: Image.asset(
              isConfirmHiddenPassword
                  ? 'assets/SignUp/eye.png'
                  : 'assets/SignUp/eye.png',
              width: 20,
              color: kStyleAppColor,
            ),
          ),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Please enter a password";
        }
        if (value.length < 8) {
          return "Your password must be at least 8 character";
        }
        // if (!value.contains(RegExp(
        //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
        //   return "Your password must contain certain letters eg:(Aa9@)";
        // }
        return null;
      },
    );
  }
}

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({
    Key? key,
    required this.confirmPasswordController,
    required this.isConfirmHiddenPassword,
    required this.passwordController,
    required this.onPress
  }) : super(key: key);

  final TextEditingController confirmPasswordController;
  final bool isConfirmHiddenPassword;
  final TextEditingController passwordController;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      style: const TextStyle(
        fontFamily: 'NutinoSansReg',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff777777),
      ),
      obscureText: isConfirmHiddenPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        filled: true,
        focusedBorder: kStyleFocused,
        enabledBorder: kStyleEnabled,
        errorBorder: kStyleError,
        focusedErrorBorder: kStyleFocusedError,
        hintText: 'Confirm Password',
        hintStyle: kStyleHintStyle,
        contentPadding:
        const EdgeInsets.fromLTRB(8, 16, 0, 0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 12),
          child: Image.asset(
            'assets/SignUp/lock.png',
            width: 20,
            color: kStyleAppColor,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 17),
          child: InkWell(
            onTap: onPress,
            child: Image.asset(
              isConfirmHiddenPassword
                  ? 'assets/SignUp/eye.png'
                  : 'assets/SignUp/eye.png',
              width: 20,
              color: kStyleAppColor,
            ),
          ),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Please re enter your password";
        }
        if (passwordController.text !=
            confirmPasswordController.text) {
          return "Both the passwords don't match";
        }
        return null;
      },
    );
  }
}

class TextFormFieldForLoginRegister extends StatelessWidget {
  const TextFormFieldForLoginRegister({this.label,this.imageName,this.textFieldDesignType, this.textFieldType,this.controller}) : super();
  final String? label;
  final String? imageName;
  final String? textFieldDesignType;
  final String? textFieldType;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kStyleContainer,
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0, 1),
                color: Color(0xff000000).withOpacity(0.1)
            ),
          ]
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        obscureText: textFieldType == "password" ? true : false,
        decoration:  InputDecoration(
          label:  Text(label ?? 'Nothing to Show', style: kStyleNormal),
          // hintText: 'enter username',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 26, right: 17),
            child: Image.asset(imageName ?? 'failed', width: 20),
          ),
          filled: true,
          fillColor: Colors.white, //To color the text field do these
          border:  UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
            textFieldDesignType == "top"?
            const BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0))
                : textFieldDesignType == "bottom" ? BorderRadius.only(bottomLeft: Radius.circular(6.0), bottomRight: const Radius.circular(6.0)) :
            textFieldDesignType == "both" ? BorderRadius.all(Radius.circular(6.0)): BorderRadius.all(Radius.circular(0.0)),
          ),
        ),

      ),
    );
  }
}