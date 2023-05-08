import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import 'karier_screen.dart';
import '../../theme.dart';
import 'package:heroicons/heroicons.dart';

class IndexHomeScreen extends StatefulWidget {
  const IndexHomeScreen({super.key});

  @override
  State<IndexHomeScreen> createState() => _IndexHomeScreenState();
}

class _IndexHomeScreenState extends State<IndexHomeScreen> {
  final authC = Get.find<AuthController>();
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Ini Adalah hasil dari : ${authC.streamAuthStatus}');
  }

  static final List<Widget> _choseTab = [
    const KarierScreen(),
    Center(
      child: Text(
        'Halaman Semua Lamaran',
        style: headingTitle.copyWith(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        textAlign: TextAlign.center,
        'Halaman Lamaran yang disukai',
        style: headingTitle.copyWith(fontSize: 30),
      ),
    ),
    Center(
      child: Text(
        'Halaman Setting Account',
        style: headingTitle.copyWith(fontSize: 30),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: secondaryColor,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.home,
              ),
              label: "Karier",
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.clipboardDocumentCheck,
              ),
              label: "Lamaran",
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.heart,
              ),
              label: "Lamaran disuka",
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.user,
              ),
              label: "Akun",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: textMenu,
          selectedItemColor: Colors.white,
          unselectedLabelStyle: textMenu,
          unselectedItemColor: const Color(0xff777777),
          onTap: _onItemTapped,
        ),
      ),
      backgroundColor: primaryColor,
      body: Center(
        child: _choseTab.elementAt(_selectedIndex),
      ),
    );
  }
}
