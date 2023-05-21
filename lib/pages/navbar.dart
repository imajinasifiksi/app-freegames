import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/profile.dart';
import '../pages/home.dart';
import '../pages/moneyconverter.dart';
import '../pages/calendar.dart';
import '../pages/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _container = const [Profile(), Home(), MoneyConv(), Calendar(), Login()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          if (index == 4) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));

            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.remove("id");
          }
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.games,
            ),
            icon: Icon(
              Icons.games,
              color: Colors.grey,
            ),
            label: "Games",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.money,
            ),
            icon: Icon(
              Icons.money,
              color: Colors.grey,
            ),
            label: "Money",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.access_time,
            ),
            icon: Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
            label: "Times",
          ),BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.exit_to_app,
            ),
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            label: "Log Out",
          )
        ],
      ),
    );
  }
}