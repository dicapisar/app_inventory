import 'package:app_inventory/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../components/image_screen_component.dart';
import '../widgets/custom_input_field.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            title: Text('Usuario'),
          ),
          Container(
              child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: const [
                      _Form(),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
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
          _UserPhoto(),
          const SizedBox(
            height: 30,
          ),
          CustomInputField(
            labelText: 'Nombre de Usuario',
            hintText: 'Nombre de Usuario',
            keyboardType: TextInputType.text,
            prefixIcon: Icons.account_circle_outlined,
            formProperty: 'userName',
            formValues: formValues,
            validation: true,
            initialValue: 'UserName',
            readOnly: true,
            icon: Icons.mode_edit_sharp,
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
            readOnly: true,
            initialValue: 'Contrasena',
            icon: Icons.mode_edit_sharp,
          ),
          SizedBox(
            height: 30,
          ),
          _AboutApplicationText(),
          SizedBox(
            height: 30,
          ),
          _CloseSession()
        ],
      ),
    );
  }
}

class _UserPhoto extends StatelessWidget {
  const _UserPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          maxRadius: 120,
          backgroundColor: Colors.grey[200],
          child: const ImageScreenComponent(
            pahtImage: 'assets/images/user.png',
            percentageWidth: 0.4,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 25),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(50),
            boxShadow: AppTheme.optionMenuDecoration.boxShadow,
          ),
          child: Icon(
            Icons.file_upload_outlined,
            color: Colors.white,
            size: 50,
          ),
        )
      ],
    );
  }
}

class _AboutApplicationText extends StatelessWidget {
  const _AboutApplicationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text(
        'Informacion sobre esta aplicacion',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppTheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        AboutDialog about = AboutDialog();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return about;
          },
        );
      },
    );
  }
}

class _CloseSession extends StatelessWidget {
  const _CloseSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text(
        'Terminar la sesión',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () =>
          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false),
    );
  }
}
