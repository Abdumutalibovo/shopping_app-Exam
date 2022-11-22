import 'package:flutter/material.dart';
import '../../../../data/my_repository.dart';
import '../../../../data/repository/app_repository.dart';
import '../basket/basket_screen.dart';
import '../categories/categories_screen.dart';
class MainBox extends StatefulWidget {
  const MainBox({Key? key}) : super(key: key);

  @override
  State<MainBox> createState() => _MainBoxState();
}

class _MainBoxState extends State<MainBox> {
  int currentIndex = 0;
  late MyRepository myRepository;
  List<Widget> screens = [];

  @override
  void initState() {
    myRepository = MyRepository(
      apiProvider: AppRepository(),
    );

    screens = [
      CategoriesScreen(myRepository: myRepository),
      BasketScreen(myRepository: myRepository),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        iconSize: 24,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.green),
        items: [
          getItem(icon: Icons.category_rounded, labelText: "Kategoriyalar"),
          getItem(icon: Icons.shopping_basket_rounded, labelText: "Savatcha"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
