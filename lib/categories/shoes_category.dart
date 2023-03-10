import 'package:flutter/material.dart';
import 'package:amazon_clone/utilities/categ_list.dart';
import 'package:amazon_clone/utilities/categ_widget.dart';

class ShoesCategory extends StatelessWidget {
  const ShoesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(
                    headerLabel: 'Shoes',
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                          mainAxisSpacing: 70,
                          crossAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(shoes.length, (index) {
                            // ignore: prefer_const_constructors
                            return SubcategModel(
                              mainCategName: 'Shoes',
                              subCategName: shoes[index],
                              assetName: 'images/shoes/shoes$index.jpg',
                              subcategLabel: shoes[index],
                            );
                          })))
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.05,
                child: const SliderBar(
                  maincategName: 'Shoes',
                ),
              ))
        ],
      ),
    );
  }
}
