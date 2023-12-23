import 'package:coffee_shop/pages/bottom_nav_bar.dart';
import 'package:coffee_shop/util/cofee_type.dart';
import 'package:coffee_shop/util/coffee_tile.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List cofeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Mocha',
      false,
    ],
    [
      'Cold Coffee',
      false,
    ]
  ];

  void cofeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < cofeeType.length; i++) {
        cofeeType[i][1] = false;
      }
      cofeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // Title Text
            Text(
              'Find the Best one for you!',
              style: GoogleFonts.outfit(fontSize: 42),
            ),
            const SizedBox(
              height: 20,
            ),

            //Search bar
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            //horizontal ListView of coffee tile

            SizedBox(
              height: 20,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cofeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: cofeeType[index][0],
                        isSelected: cofeeType[index][1],
                        onTap: () {
                          cofeeTypeSelected(index);
                        });
                  }),
            ),
            const SizedBox(
              height: 10,
            ),

            //horizontal coffee tile
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee1.jpg',
                      coffePrice: '100',
                      coffeeName: 'Latte'),
                  CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee2.jpg',
                      coffePrice: '50',
                      coffeeName: 'Coffee'),
                  CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee3.jpg',
                      coffePrice: '150',
                      coffeeName: 'Cappucino'),
                  CoffeeTile(
                      coffeeImagePath: 'lib/images/black.jpg',
                      coffePrice: '80',
                      coffeeName: 'Black Coffee'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
