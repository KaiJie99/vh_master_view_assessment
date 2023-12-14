import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.isLandscape,
    required this.item,
  });

  final bool isLandscape;
  final Item item;

  @override
  Widget build(BuildContext context) {
    final Widget content = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24.0,
          ),
          Text(
            item?.title ?? 'No item selected!',
            style: const TextStyle(
              fontSize: 36.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            item?.detail ?? 'Please select one on the left.',
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            item?.moreDetail ?? '',
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );

    if (isLandscape) {
      return Center(child: content);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(item.title),
      // ),
      body: content,
    );
  }
}
