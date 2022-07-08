import 'package:app_inventory/components/components.dart';
import 'package:app_inventory/models/advise_item_list.dart';
import 'package:app_inventory/models/form_screen_arguments.dart';
import 'package:app_inventory/models/input_record.dart';
import 'package:app_inventory/models/item_detail.dart';
import 'package:app_inventory/models/list_screen_arguments.dart';
import 'package:app_inventory/screens/contants.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListScreenOutputRecord extends StatefulWidget {
  const ListScreenOutputRecord({Key? key}) : super(key: key);

  @override
  State<ListScreenOutputRecord> createState() => _ListScreenOutputRecordState();
}

class _ListScreenOutputRecordState extends State<ListScreenOutputRecord> {
  final Map<String, String> formValues = {
    'buscar': '',
  };

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ListScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ListScreenArguments;

    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      key: _key,
      endDrawer: const Drawer(
        child: OptionsFilter(),
      ),
      appBar: AppBar(
        title: Text(args.title),
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  width: width * 0.6,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: CustomInputField(
                      formProperty: 'Buscar',
                      formValues: formValues,
                      prefixIcon: Icons.search,
                      labelText: 'Buscar',
                      hintText: 'Buscar',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _key.currentState!.openEndDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 20),
                    width: width * 0.2,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      child: Text(
                        'Filtrar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListItem(
              itemDetail: getDataOutputRecord(),
              screenNameRoute: 'formOutputRecord',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            'formOutputRecord',
            arguments: FormScreenArguments(
              title: 'Creacion Nuevo ${args.singularName}',
            ),
          );
        },
        child: const Icon(
          Icons.add_outlined,
          size: 50,
        ),
      ),
    );
  }
}

List<ItemDetail> getDataOutputRecord() {
  final List<ItemDetail> listItemDetail = [];
  for (var inputRecord in getInfoForAPICallOutputRecord()) {
    List<String> details = [];
    AdviseItemLIst advise = AdviseItemLIst('', Colors.transparent);

    if (inputRecord.creationDate.difference(DateTime.now()).inDays < 2) {
      advise = AdviseItemLIst('Nuevo', Colors.green);
    }

    var dateCreation = inputRecord.creationDate;

    details.add(inputRecord.status);
    details.add(inputRecord.reason);
    details
        .add("${dateCreation.year}/${dateCreation.month}/${dateCreation.day}");

    final itemDetail = ItemDetail(
      inputRecord.id,
      'Registro de Salida No. ${inputRecord.id}',
      'Id ${inputRecord.id}',
      details,
      advise,
    );

    listItemDetail.add(itemDetail);
  }

  return listItemDetail;
}

List<InputRecord> getInfoForAPICallOutputRecord() {
  return Constant().getDataOutputItems();
}
