import 'package:flutter/material.dart' ;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Driver/Home/driver_home/driver_home.dart';
import 'package:the_middlemen/UI/Driver/Profile/driver_profile.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';

class BottomNavigationDriver extends StatefulWidget {
  const BottomNavigationDriver({Key? key}) : super(key: key);

  @override
  _BottomNavigationDriverState createState() => _BottomNavigationDriverState();
}

class _BottomNavigationDriverState extends State<BottomNavigationDriver> {
  int _currentIndex = 0;

  final _children = [
    const DriverHome(),
    const DriverProfile(),
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
              selectedColor: Colors.pinkAccent,
            ),
          ],
          onTap: _onChanged,
        ),
      ),
    );
  }
}
