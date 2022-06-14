import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(children: [
              const Text(
                'Recuperar',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Contraseña',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage('assets/images/forgot_password.png'),
                fit: BoxFit.contain,
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: myFormKey,
                child: Column(
                  children: [
                    CustomInputField(
                      labelText: 'Número Identificación',
                      hintText: 'Número de Identificación',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.account_circle_outlined,
                      formProperty: 'userName',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInputField(
                      labelText: 'Correo Electrónico',
                      hintText: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      formProperty: 'email',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Si los datos suministrados son los correctos se enviará un email con la nueva contraseña',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Si no ves el email en tu bandeja de entrada por favor revisa en la carpeta de Spam',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Solicitar Nueva Contraseña',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!myFormKey.currentState!.validate()) {
                          print('formulario no valido');
                          return;
                        }
                        print(formValues);
                        Navigator.pushNamed(context, 'login');
                      },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
