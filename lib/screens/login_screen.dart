import 'package:app_inventory/components/components.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            child: Column(children: const [
              TitleScreenComponent(
                text: ['Bienvenid@ a', 'App Inventory'],
              ),
              SizedBox(
                height: 20,
              ),
              ImageScreenComponent(
                pahtImage: 'assets/images/logo.png',
                percentageWidth: 0.6,
              ),
              SizedBox(
                height: 30,
              ),
              _Form(),
              SizedBox(height: 30),
              _TextForgotPassword()
            ]),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'userName': '',
      'password': '',
    };

    return Form(
      key: myFormKey,
      child: Column(
        children: [
          CustomInputField(
            labelText: 'Nombre de Usuario',
            hintText: 'Nombre de Usuario',
            keyboardType: TextInputType.text,
            prefixIcon: Icons.account_circle_outlined,
            formProperty: 'userName',
            formValues: formValues,
            validation: true,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomInputField(
            labelText: 'Contraseña',
            hintText: 'Contraseña',
            keyboardType: TextInputType.text,
            prefixIcon: Icons.email_outlined,
            formProperty: 'password',
            formValues: formValues,
            validation: true,
            obscureText: true,
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
                  'Ingresar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (!myFormKey.currentState!.validate()) {
                return;
              }
              if (!formValues[0].toString().isNotEmpty &&
                  !formValues[1].toString().isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Error en ingreso'),
                    content: const Text(
                      'Usuario y/o contraseña incorrectos',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, 'login', (route) => false),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return;
              }
              Navigator.pushNamedAndRemoveUntil(
                context,
                'home',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}

class _TextForgotPassword extends StatelessWidget {
  const _TextForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text(
        'Olvide mi contraseña',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppTheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'forgotPassword');
      },
    );
  }
}
