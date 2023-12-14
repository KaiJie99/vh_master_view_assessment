import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'item.dart';

class ItemList extends StatelessWidget {
  ItemList({
    required this.itemSelectedCallback,
    this.selectedItem,
    this.isLandscape = false,
  });

  final ValueChanged<Item> itemSelectedCallback;
  final Item? selectedItem;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        return Column(
          children: [
            ListTile(
              title: Text(
                item.title,
                style: const TextStyle(fontSize: 24.0),
              ),
              trailing: isLandscape
                  ? const SizedBox(
                      height: 1.0,
                      width: 1.0,
                    )
                  : const Icon(Icons.arrow_forward_ios),
              onTap: () => itemSelectedCallback(item),
              selected: selectedItem == item,
            ),
            const Divider(
              height: 1.0,
              // color: Colors.black,
            )
          ],
        );
      }).toList(),
    );
  }
}
