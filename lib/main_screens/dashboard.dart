import 'package:flutter/material.dart';
import 'package:amazon_clone/dashboard_compents/balance.dart';
import 'package:amazon_clone/dashboard_compents/edit_profile.dart';
import 'package:amazon_clone/dashboard_compents/manage_products.dart';
import 'package:amazon_clone/dashboard_compents/mystore.dart';
import 'package:amazon_clone/dashboard_compents/statics.dart';
import 'package:amazon_clone/dashboard_compents/supplier_orders.dart';
import 'package:amazon_clone/utilities/appbar_widget.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics',
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings_applications,
  Icons.attach_money,
  Icons.show_chart,
];

List<Widget> pages = const [
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProducts(),
  Balance(),
  Statics(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const AppBarTitle(title: 'Dashboard'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/welcome_screen');
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ))
            ]),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.count(
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pages[index]));
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.purpleAccent.shade200,
                  color: Colors.blueGrey.withOpacity(0.7),
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            fontFamily: 'Acme'),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
