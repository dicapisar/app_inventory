import 'package:app_inventory/models/item_detail.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ListItem extends StatelessWidget {
  final List<ItemDetail> itemDetail;
  const ListItem({
    Key? key,
    required this.itemDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 670,
      width: width * 0.9,
      child: ListView.builder(
        itemCount: itemDetail.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, int index) => ItemList(
            id: itemDetail[index].id,
            title: itemDetail[index].title,
            subTitle: itemDetail[index].subTitle,
            details: [
              itemDetail[index].details.elementAt(0),
              itemDetail[index].details.elementAt(1),
              itemDetail[index].details.elementAt(2),
            ],
            advise: itemDetail[index].advise),
      ),
    );
  }
}
