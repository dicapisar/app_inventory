import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/widgets.dart';
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
            child: Column(children: [
              const Text(
                'Bienvenido a App Inventory',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
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
                      labelText: 'Usuario',
                      hintText: 'Usuario Único',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icons.account_circle_outlined,
                      formProperty: 'userName',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInputField(
                      labelText: 'Contraseña',
                      hintText: 'Contraseña',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.security_outlined,
                      obscureText: true,
                      formProperty: 'password',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Ingresar',
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!myFormKey.currentState!.validate()) {
                          print('formulario no valido');
                          return;
                        }
                        print(formValues);
                        Navigator.pushNamed(context, 'home');
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Olvide mi contraseña',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  decoration: TextDecoration.underline,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
