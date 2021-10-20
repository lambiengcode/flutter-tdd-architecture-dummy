import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_architecture/src/common/app_decoration.dart';
import 'package:flutter_tdd_architecture/src/common/color.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  String email = '';
  String password = '';

  bool hidePassword = true;
  bool rememberPsw = false;

  hideKeyboard() => usernameFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Form(
          key: _formKey,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 12.sp),
                          Container(
                            height: 42.h,
                            width: 100.w,
                            margin: EdgeInsets.fromLTRB(
                              10.w,
                              8.8.h - 12.sp,
                              10.w,
                              12.sp,
                            ),
                            child: Container(),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              10.w,
                              0.0,
                              10.w,
                              MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: AppDecoration.buttonActionBorder(
                                    context,
                                    6.sp,
                                  ).decoration,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 10.0),
                                      _buildLineInfo(
                                        context,
                                        'Email',
                                        'Hãy nhập email của bạn',
                                        usernameFocus,
                                      ),
                                      Divider(
                                        thickness: .25,
                                        height: .25,
                                        indent: 16.sp,
                                        endIndent: 16.sp,
                                      ),
                                      _buildLineInfo(
                                        context,
                                        'Mật khẩu',
                                        'Mật khẩu phải có tối thiểu 6 kí tự',
                                        passwordFocus,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 18.sp,
                                      bottom: 12.sp,
                                    ),
                                    alignment: Alignment.center,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Theme.of(context).textTheme.bodyText2!.color,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Bạn chưa có tài khoản? ',
                                          ),
                                          TextSpan(
                                            text: 'Đăng kí ngay',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.sp),
                                GestureDetector(
                                  onTap: () async {
                                    BlocProvider.of<AuthBloc>(context).add(LoginEvent());
                                  },
                                  child: Container(
                                    height: 40.sp,
                                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      color: colorPrimary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Đăng nhập',
                                        style: TextStyle(
                                          color: mC,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  '@${DateTime.now().year} lambiengcode copyright',
                  style: TextStyle(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineInfo(context, title, valid, focusNode) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        focusNode: focusNode,
        onFieldSubmitted: (val) {
          if (title == 'Email') {
            usernameFocus.unfocus();
            passwordFocus.requestFocus();
          } else {}
        },
        cursorRadius: Radius.circular(30.0),
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.95),
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter,
        ],
        validator: (val) => null,
        onChanged: (val) {
          if (title == 'Email') {
            email = val.trim();
          } else {
            password = val.trim();
          }
        },
        obscureText: title == 'Mật khẩu' ? hidePassword : false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(
            left: 12.0,
          ),
          border: InputBorder.none,
          labelText: title,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.8),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: title == 'Mật khẩu'
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? PhosphorIcons.eyeSlash : PhosphorIcons.eye,
                    color: colorPrimary,
                    size: 16.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
