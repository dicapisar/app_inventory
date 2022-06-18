import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };

    final FormScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${args.title}',
          style: TextStyle(overflow: TextOverflow.ellipsis),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Icon(
            Icons.more_vert_rounded,
            color: AppTheme.primary,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Form(
                key: myFormKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Id',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Text',
                            hintText: 'Texto',
                            keyboardType: TextInputType.text,
                            formProperty: 'text',
                            formValues: formValues,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Id',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Text',
                            hintText: 'Texto',
                            keyboardType: TextInputType.text,
                            formProperty: 'text',
                            formValues: formValues,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Id',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Id',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Id',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.save,
          size: 40,
        ),
      ),
    );
  }
}
