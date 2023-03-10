import 'package:flutter/material.dart';
import 'package:amazon_clone/utilities/appbar_widget.dart';

class SubCategProducts extends StatelessWidget {
  final String maincategName;
  final String subcategName;

  SubCategProducts(
      {Key? key, required this.subcategName, required this.maincategName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: subcategName),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
      ),
      body: Center(child: Text(maincategName)),
    );
  }
}
