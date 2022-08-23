import 'package:flutter/material.dart' ;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:the_middlemen/UI/Customer/Home/cus_home.dart';
import 'package:the_middlemen/UI/Customer/Profile/cus_profile.dart';
import 'package:the_middlemen/UI/Customer/Settings/settings.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';

class BottomNavigationCus extends StatefulWidget {
  const BottomNavigationCus({Key? key}) : super(key: key);

  @override
  _BottomNavigationCusState createState() => _BottomNavigationCusState();
}

class _BottomNavigationCusState extends State<BottomNavigationCus> {
  int _currentIndex = 0;

  final _children = [
    const CusHome(),
    const CusProfile(),
    const CusSettings()
  ];

  void _onChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(_currentIndex != 0) {
          _onChanged(0);
        }else if(_currentIndex == 0){
          await showBackDialog(context);
        }
        return false;

      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _children[_currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey.shade700,
          items:  [
            SalomonBottomBarItem(
              icon: const ImageIcon(
                AssetImage('assets/BottomNav/home.png'),
              ),
              title: const Text('Home'),
              selectedColor: const Color(0xff3FA5DF),
            ),
            SalomonBottomBarItem(
              icon: const ImageIcon(
                AssetImage('assets/BottomNav/profile.png'),
              ),
              title: const Text('Profile'),
              selectedColor: Colors.orangeAccent,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.settings_outlined
              ),
              title: const Text('Settings'),
              selectedColor: Colors.pinkAccent,
            ),
          ],
          onTap: _onChanged,
        ),
      ),
    );
  }
}
