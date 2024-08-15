import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piano_buddy/funky.dart';
import '../widgets/stack.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Piano',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: 'Buddy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: FunkyButton(
              backgroundColor: FunkyColors.PRIMARY,
              shape: FunkyButtonShape.standard,
              onPressed: () {
                // Add your action here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed!')),
                );
              },
              rotateAngle: -10.0,
              width: 30,
              height: 30,
              child: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  'lib/assets/bell_outline.svg',
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(
          top: 150.0,
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Stacked Elements with a fixed height or wrapped in Expanded
            Container(
              height: 150,
              width: 250, // Adjust this height as needed

              child: StackedElements(
                  horizontalElementSpacing: 10,
                  verticalElementSpacing: 10,
                  children: [Text('hello'), Text('world'), Text('3')]),
            ),
            // Horizontal List of Options
            Container(
              height: 100,
              padding: EdgeInsets.only(top: 40),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FunkyButton(width: 80, height: 30, 
                      backgroundColor: FunkyColors.PRIMARY,
                      child: Center(child: Text('option 1'))),

                      FunkyButton(width: 80, height: 30, child: Center(child: Text('option 2'))),
                      FunkyButton(width: 80, height: 30, child: Center(child: Text('option 3'))),
                    ],
                  ),
                ],
              ),
            ),
            // Vertical List of Widgets
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.purple,

                      ),
                      child: Center(child: Text('Item 1'))),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.teal,

                      ),
                      child: Center(child: Text('Item 2'))),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.indigo,

                      ),
                      child: Center(child: Text('Item 3'))),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
        ],
        currentIndex: 0, // Set the current index here
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/business');
              break;
            case 2:
              Navigator.pushNamed(context, '/school');
              break;
          }
        },
      ),
    );
  }
}
