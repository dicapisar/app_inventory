import 'package:app_inventory/models/item_input_db.dart';
import 'package:app_inventory/models/item_output_db.dart';
import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/screens/contants.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/input_record.dart';
import '../models/item_detail.dart';

class FormOutputRecordScreen extends StatelessWidget {
  const FormOutputRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };

    final FormScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    var size = MediaQuery.of(context).size;
    var width = size.width;
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
        height: height,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(color: Colors.grey[300]),
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
                                initialValue: "123456789",
                                readOnly: true,
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
                                formProperty: 'status',
                                formValues: formValues,
                                initialValue: "Abierto",
                                readOnly: true,
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
                                labelText: 'Razón',
                                hintText: 'Razón',
                                keyboardType: TextInputType.text,
                                formProperty: 'reason',
                                formValues: formValues,
                                initialValue: 'En Creación',
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
                                labelText: 'Fecha de Creación',
                                hintText: 'Fecha de Creación',
                                keyboardType: TextInputType.datetime,
                                formProperty: 'dateCreation',
                                formValues: formValues,
                                initialValue:
                                    '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset.fromDirection(1, 4),
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Articulos',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        ListItem(
                          itemDetail: getDataOutputRecordForm(),
                          screenNameRoute: 'formItemOutput',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            'formItemOutput',
            arguments: FormScreenArguments(
              title: 'Creacion Nuevo Articulo de Salida',
              isRead: false,
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

List<ItemDetail> getDataOutputRecordForm() {
  final List<ItemDetail> listItemDetail = [];

  for (var inputRecord in getInfoForAPICallOutputRecordForm()) {
    AdviseItemLIst advise = AdviseItemLIst('', Colors.transparent);
    List<String> details = [];

    details.add(inputRecord.status);
    details.add(inputRecord.count.toString());
    details.add('');

    final itemDetail = ItemDetail(
      inputRecord.id,
      'Name of Article ${inputRecord.itemId}',
      'Id: ${inputRecord.id}',
      details,
      advise,
    );

    listItemDetail.add(itemDetail);
  }

  return listItemDetail;
}

List<ItemOutputDB> getInfoForAPICallOutputRecordForm() {
  return Constant().getDataItemOutputDB();
}
