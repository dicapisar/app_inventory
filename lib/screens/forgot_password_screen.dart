import 'package:app_inventory/components/components.dart';
import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: const [
                TitleScreenComponent(
                  text: [
                    'Recuperar',
                    'Contraseña',
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ImageScreenComponent(
                  pahtImage: 'assets/images/forgot_password.png',
                  percentageWidth: 0.6,
                ),
                SizedBox(
                  height: 30,
                ),
                _Form()
              ],
            ),
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
      'numberIdentification': '',
      'email': '',
    };

    return Form(
      key: myFormKey,
      child: Column(
        children: [
          CustomInputField(
            labelText: 'Número Identificación',
            hintText: 'Número de Identificación',
            keyboardType: TextInputType.number,
            prefixIcon: Icons.account_circle_outlined,
            formProperty: 'numberIdentification',
            formValues: formValues,
            validation: true,
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
            validation: true,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Si los datos suministrados son los correctos se enviará un email con la nueva contraseña',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Si no ves el email en tu bandeja de entrada por favor revisa en la carpeta de Spam',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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
                return;
              }
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Solicitud Procesada'),
                  content: const Text(
                    'Su solicitud de actualización de contraseña fue procesada exitosamente',
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
            },
          )
        ],
      ),
    );
  }
}
