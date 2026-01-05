import 'package:flutter/material.dart';
import 'animals_screen.dart';
import 'qrcha_screen.dart';
import 'account_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const AnimalsScreen(),
    const QrchaScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos.PNG',
              height: 32,
              width: 32,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            const Text(
              'QRCHA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade800, Colors.red.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade900.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.yellow.shade300,
            unselectedItemColor: Colors.white.withOpacity(0.8),
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            elevation: 0,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: _buildAnimalIcon(isSelected: _selectedIndex == 0),
                activeIcon: _buildAnimalIcon(isSelected: true),
                label: 'ANIMALS',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  size: _selectedIndex == 1 ? 28 : 24,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart_rounded,
                  size: 28,
                  color: Colors.yellow.shade300,
                ),
                label: 'QRCHA',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: _selectedIndex == 2 ? 28 : 24,
                ),
                activeIcon: Icon(
                  Icons.person,
                  size: 28,
                  color: Colors.yellow.shade300,
                ),
                label: 'ACCOUNT',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalIcon({required bool isSelected}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Bull horn shape using custom icons
        Icon(
          Icons.change_history_rounded,
          size: isSelected ? 28 : 24,
          color: isSelected ? Colors.yellow.shade300 : Colors.white.withOpacity(0.8),
          textDirection: TextDirection.rtl,
        ),
        Transform.rotate(
          angle: -0.5,
          child: Icon(
            Icons.chevron_right,
            size: isSelected ? 22 : 18,
            color: isSelected ? Colors.yellow.shade300 : Colors.white.withOpacity(0.8),
          ),
        ),
        Transform.rotate(
          angle: 0.5,
          child: Icon(
            Icons.chevron_left,
            size: isSelected ? 22 : 18,
            color: isSelected ? Colors.yellow.shade300 : Colors.white.withOpacity(0.8),
          ),
        ),
        // Bull face dot
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: isSelected ? Colors.yellow.shade300 : Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}