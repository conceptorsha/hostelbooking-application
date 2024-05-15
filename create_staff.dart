import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hostel_one/presentation/admin/controller/admin_controller.dart';
import 'package:hostel_one/presentation/auth_screens/controller/auth_controller.dart';
import 'package:hostel_one/utils/app_bar.dart';
import 'package:hostel_one/utils/custom_txt_field.dart';
import 'package:hostel_one/utils/spacing.dart';

import '../../utils/custom_bn.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_theme.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({required AuthController authController, super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AdminController adminController = Get.find();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController role = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    role.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context, "Create Staff"),
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  controller: userName,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('First Name', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                  controller: firstName,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                heightSpacer(15),
                Text('Last Name', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                  controller: lastName,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                // heightSpacer(15),
                // Text('Job Role', style: AppTextTheme.kLabelStyle),
                // CustomTextField(
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Job Role is required';
                //     }
                //     return null;
                //   },
                //   controller: role,
                //   enabledBorder: OutlineInputBorder(
                //       borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                //       borderRadius: BorderRadius.circular(14)),
                // ),
                // heightSpacer(15),
                Text('Email', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('Password', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  controller: password,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(15),
                Text('Phone Number', style: AppTextTheme.kLabelStyle),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                  controller: phoneNumber,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                      borderRadius: BorderRadius.circular(14)),
                ),
                heightSpacer(40),
                CustomButton(
                  btnText: "Create Staff",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      print('validated');
                      await adminController.storeNewUsertoDb(
                          email: email.text,
                          userName: userName.text,
                          firstName: firstName.text,
                          lastName: lastName.text,
                          phoneNumber: phoneNumber.text,
                          password: password.text);
                    }
                  },
                ),
                heightSpacer(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
}
