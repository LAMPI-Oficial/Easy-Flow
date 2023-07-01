import 'package:easyflow/layers/widgets/listview/listview_widget.dart';
import 'package:flutter/material.dart';

class Modals {
  static select(
      {required BuildContext context,
      Widget? title,
      Future<void> Function()? onRefresh,
      Future<List<dynamic>?> Function()? asyncListCallback,
      required Widget Function(dynamic) builder,
      required Widget Function(BuildContext, int)? separatorBuilder,
      List<dynamic> Function(String, List<dynamic>)? asyncListFilter,
      EdgeInsetsGeometry? padding,
      bool? searchFieldEnabled}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: title,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close)),
            ),
            body: SafeArea(
              child: ListViewWidget(
                  searchFieldEnabled: searchFieldEnabled!,
                  padding: padding,
                  asyncListFilter: asyncListFilter,
                  onRefresh: onRefresh,
                  asyncListCallback: asyncListCallback,
                  separatorBuilder: separatorBuilder,
                  builder: builder),
            )));
  }
}
