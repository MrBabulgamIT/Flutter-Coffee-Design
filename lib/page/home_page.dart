import 'package:coffe_ui_flutter/page/coffe_type.dart';
import 'package:coffe_ui_flutter/page/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
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
      'Milk Coffe',
      false,
    ],
    [
      'Green Tea',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  void coffeeTypeSelector(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Icon(Icons.person),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Fevorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
        ]),
        body: Column(
          children: [
            //find the best coffe for you

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Find the best Coffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //Search Bar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'find Your Coffee....',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: ((context, index) {
                      return CoffeType(
                          coffeeType: coffeeType[index][0],
                          onTap: () {
                            coffeeTypeSelector(index);
                          },
                          isSelected: coffeeType[index][1]);
                    })),
              ),
            ),

            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Coffee_Tile(
                    coffeImagePath: "images/captino_1.jpg",
                    coffeeName: "Cappucino",
                    titlecoffe: 'with almond milk',
                    coffePrice: '4.20'),
                Coffee_Tile(
                    coffeImagePath: "images/ab.jpg",
                    coffeeName: "Latte",
                    titlecoffe: 'with Milk latte',
                    coffePrice: '4.20'),
                Coffee_Tile(
                    coffeImagePath: "images/main_2.jpg",
                    coffeeName: "Balck",
                    titlecoffe: "Without milk  just coffe",
                    coffePrice: '3.50'),
                Coffee_Tile(
                    coffeImagePath: "images/milk.jpg",
                    coffeeName: "Milk Coffe thing",
                    titlecoffe: 'With Milk ',
                    coffePrice: '4.50'),
              ],
            ))

            //Horizontal listview of coffee titles
          ],
        ));
  }
}
