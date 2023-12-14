import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vh_master_view_assessment/item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Item_list.dart';
import 'item_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Item? selectedItem;

  Widget potraitView() {
    return ItemList(
      itemSelectedCallback: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ItemDetails(
                item: item,
                isLandscape: false,
              );
            },
          ),
        );
      },
    );
  }

  Widget landscapeView() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: ItemList(
              isLandscape: true,
              itemSelectedCallback: (item) {
                setState(() {
                  selectedItem = item;
                });
              },
              selectedItem: selectedItem,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ItemDetails(
            item: selectedItem ??
                Item(
                    title: 'please select a item to display',
                    detail: '',
                    moreDetail: ''),
            isLandscape: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    late Widget content;
    Orientation orientation = MediaQuery.of(context).orientation;
    print('orientation ==> $orientation');
    if (orientation == Orientation.portrait) {
      content = potraitView();
    } else if (orientation == Orientation.landscape) {
      content = landscapeView();
    }

    return Scaffold(
      // appBar: AppBar(title: Text('Master_View_KJ')),
      body: content,
    );
  }
}
