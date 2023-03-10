import 'package:flutter/material.dart';
import 'package:amazon_clone/utilities/categ_list.dart';
import 'package:amazon_clone/utilities/categ_widget.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

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
                    headerLabel: 'men',
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                          mainAxisSpacing: 70,
                          crossAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(men.length, (index) {
                            // ignore: prefer_const_constructors
                            return SubcategModel(
                              mainCategName: 'men',
                              subCategName: men[index],
                              assetName: 'images/men/men$index.jpg',
                              subcategLabel: men[index],
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
                  maincategName: 'men',
                ),
              ))
        ],
      ),
    );
  }
}
