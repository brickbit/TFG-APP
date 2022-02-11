import 'package:flutter/material.dart';
import 'package:tfg_app/app/controllers/login_controller.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/widget/textfields/build_text_field.dart';
import 'package:tfg_app/app/views/widget/textfields/custom_password_textfield.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _loginView(true,
                Size.infinite.width, Size.infinite.width, Size.infinite.width);
          } else {
            return _loginView(false, 300, 300, 300);
          }
        },
      ),
    );
  }

  Widget _loginView(
      bool mobile,
    double userTextFieldWidth,
    double passwordTextFieldWidth,
    double buttonWidth,
  ) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter:
                    ColorFilter.mode((Colors.grey[400])!, BlendMode.modulate),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/mural_epcc.png'),
                    fit: BoxFit.cover,
                  )),
                  height: mobile ? 280 : 320,
                ),
              ),
              SizedBox(
                width: userTextFieldWidth,
                child: buildTextField('email'.tr, "", _usernameController),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: passwordTextFieldWidth,
                child: CustomPasswordTextField(
                  title: 'password'.tr,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  width: buttonWidth,
                  height: 45,
                  child: ElevatedButton(
                      child: Text('login'.tr),
                      onPressed: () {
                        controller.login("username", "password");
                      })),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.recoverPassword);
                  },
                  child: Text('forgottenPassword'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
