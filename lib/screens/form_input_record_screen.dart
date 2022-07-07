import 'package:app_inventory/models/item_input_db.dart';
import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/screens/contants.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/input_record.dart';
import '../models/item_detail.dart';

class FormInputRecordScreen extends StatelessWidget {
  const FormInputRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };

    final FormScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;

    print("isRead: " + args.isRead.toString());
    print("resourceId: " + args.resourceId.toString());

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    var size = MediaQuery.of(context).size;
    var width = size.width;

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
                    const Text(
                      'Articulos',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 5,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListItem(
                      itemDetail: getDataBrandsForm(),
                      screenNameRoute: 'formItemInput',
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
        child: const Icon(
          Icons.save,
          size: 40,
        ),
      ),
    );
  }
}

List<ItemDetail> getDataBrandsForm() {
  final List<ItemDetail> listItemDetail = [];

  for (var inputRecord in getInfoForAPICallBrandsForm()) {
    AdviseItemLIst advise = AdviseItemLIst('', Colors.transparent);
    List<String> details = [];

    details.add(inputRecord.status);
    details.add(inputRecord.count.toString());
    details.add('\$ ${inputRecord.cost.toString()}');

    final itemDetail = ItemDetail(
      inputRecord.id,
      'Name of Article ${inputRecord.itemId}',
      'Name Provider ${inputRecord.providerId}',
      details,
      advise,
    );

    listItemDetail.add(itemDetail);
  }

  return listItemDetail;
}

List<ItemImputDB> getInfoForAPICallBrandsForm() {
  return Constant().getDataItemInputDB();
}
