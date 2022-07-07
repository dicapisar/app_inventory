import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class FormItemImputScreen extends StatelessWidget {
  const FormItemImputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };

    final FormScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;

    final bool isRead = args.isRead ?? false;

    print(isRead);

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
                            labelText: 'Estado',
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
                            labelText: 'Articulo',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                        if (isRead) const _ButtonPlus()
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
                            labelText: 'Cantidad',
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
                            labelText: 'Costo por Unidad',
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
                            labelText: 'Proveedor',
                            hintText: 'Id',
                            keyboardType: TextInputType.number,
                            formProperty: 'id',
                            formValues: formValues,
                          ),
                        ),
                        if (isRead) const _ButtonPlus()
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ButtonSearch(
                          bigIcon: Icon(Icons.qr_code),
                          smallIcon: Icon(Icons.search),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        _ButtonSearch(
                          bigIcon: Icon(
                            Icons.line_weight_sharp,
                          ),
                          smallIcon: Icon(Icons.search),
                        ),
                      ],
                    )
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

class _ButtonPlus extends StatelessWidget {
  const _ButtonPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.add,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class _ButtonSearch extends StatelessWidget {
  final Icon bigIcon;
  final Icon smallIcon;
  const _ButtonSearch(
      {Key? key, required this.bigIcon, required this.smallIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
          child: Icon(
            bigIcon.icon,
            color: Colors.white,
            size: 120,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            smallIcon.icon,
            color: Colors.white,
            size: 40,
          ),
        )
      ],
    );
  }
}
