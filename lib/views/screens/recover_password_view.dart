
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tfg_app/controllers/recover_password_controller.dart';
import 'package:tfg_app/views/widget/build_text_field.dart';

class RecoverPasswordView extends GetView<RecoverPasswordController> {

  RecoverPasswordView({Key? key}) : super(key: key);

  final _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _recoverPasswordView(Size.infinite.width, Size.infinite.width, Size.infinite.width); //_loginView(Size.infinite.width,Size.infinite.width,Size.infinite.width);
        } else {
          return _recoverPasswordView(300,300,300);
        }
      },
    ));
  }

  Widget _recoverPasswordView(double instructionsWidth, double mailTextFieldWidth, double buttonWidth,) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recover password'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
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
                    height: 350,
                  ),
                ),
                SizedBox(
                  width: instructionsWidth,
                  child: const Text('Introduca su correo, le enviaremos un correo con las intrucciones necesarias para restaurar su contraseña'),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: mailTextFieldWidth,
                  child:
                  buildTextField('Introcuzca su correo', _mailController),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: buttonWidth,
                    height: 45,
                    child: ElevatedButton(
                        child: const Text('RecuperarContraseña'),
                        onPressed: () {
                          controller.recoverPassword("mail");
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}