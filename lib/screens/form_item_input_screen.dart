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

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    var size = MediaQuery.of(context).size;
    var height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: AppTheme.primary,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
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
                                readOnly: isRead,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Estado',
                                hintText: 'Estado',
                                keyboardType: TextInputType.text,
                                formProperty: 'text',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Articulo',
                                hintText: 'Nombre del Articulo',
                                keyboardType: TextInputType.number,
                                formProperty: 'nameArticle',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            if (!isRead) const _ButtonPlus()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Cantidad',
                                hintText: 'Cantidad',
                                keyboardType: TextInputType.number,
                                formProperty: 'count',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Costo por Unidad',
                                hintText: '\$ XX.XXX',
                                keyboardType: TextInputType.number,
                                formProperty: 'cost',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Proveedor',
                                hintText: 'Nombre del Proveedor',
                                keyboardType: TextInputType.number,
                                formProperty: 'nameProvider',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            if (!isRead) const _ButtonPlus()
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        if (!isRead) const _OptiosButtonsSearch()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _FloatingAcctionButton(
        isRead: isRead,
      ),
    );
  }
}

class _FloatingAcctionButton extends StatelessWidget {
  final bool isRead;
  const _FloatingAcctionButton({
    Key? key,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Icon saveIcon = Icon(
      Icons.save,
      size: 45,
    );
    const Icon backIcon = Icon(
      Icons.arrow_back,
      size: 45,
    );

    return FloatingActionButton(
      backgroundColor: isRead ? Colors.red : Colors.green,
      onPressed: () {
        Navigator.pop(context);
      },
      child: isRead ? backIcon : saveIcon,
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
      child: const Icon(
        Icons.add,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class _OptiosButtonsSearch extends StatelessWidget {
  const _OptiosButtonsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
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
