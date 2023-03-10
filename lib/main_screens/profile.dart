import 'package:flutter/material.dart';
import 'package:amazon_clone/customer_screens/customer_orders.dart';
import 'package:amazon_clone/customer_screens/customer_wishlist.dart';
import 'package:amazon_clone/main_screens/cart.dart';
import 'package:amazon_clone/utilities/appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.yellow, Colors.brown])),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        child: const Text(
                          'Account',
                          style: TextStyle(color: Colors.black),
                        ),
                        duration: const Duration(
                          milliseconds: 200,
                        )),
                    background: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.brown])),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('images/inapp/guest.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  'guest'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                }),
              ),
              SliverToBoxAdapter(
                  child: Column(children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            )),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen(
                                          back: AppBarBackButton(),
                                        )));
                          },
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'Orders',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerOrders()));
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Center(
                              child: Text(
                                'Wishlist',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WishlistScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                        child:
                            Image(image: AssetImage('images/inapp/logo.jpg')),
                      ),
                      const ProfileHeaderLabel(
                        headerLabel: ' Account Info. ',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: const [
                              RepeatedListTile(
                                  title: 'Email Address',
                                  subtitle: 'rawmizthapa@gmail.com',
                                  icon: Icons.email),
                              YellowDivider(),
                              RepeatedListTile(
                                  title: 'Phone',
                                  subtitle: '+91-7497813151',
                                  icon: Icons.phone),
                              YellowDivider(),
                              RepeatedListTile(
                                title: 'Address',
                                subtitle: 'Harayana, Ambala, Mullana',
                                icon: Icons.location_pin,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProfileHeaderLabel(
                        headerLabel: ' Account Settings ',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Edit Profile',
                                icon: Icons.edit,
                                onPressed: () {},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Change Password',
                                icon: Icons.lock,
                                onPressed: () {},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Logout',
                                icon: Icons.logout,
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/welcome_screen');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
            ],
          ),
        ],
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.subtitle = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({Key? key, required this.headerLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ))
        ],
      ),
    );
  }
}
