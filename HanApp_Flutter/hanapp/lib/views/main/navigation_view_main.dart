import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hanapp/main.dart';
import 'package:hanapp/views/main/pages/profile_main.dart';
import '../../firebase_options.dart';
import '../login_view.dart';
import 'pages/home_main.dart';
import 'pages/report_main.dart';
import 'pages/nearby_main.dart';
import 'pages/companion_main.dart';
import 'pages/update_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pages/report_pages/p1_classifier.dart';

class NavigationField extends StatefulWidget {
  const NavigationField({super.key});

  @override
  State<NavigationField> createState() => _NavigationFieldState();
}

class _NavigationFieldState extends State<NavigationField> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeMain(),
    ReportMain(),
    NearbyMain(),
    CompanionMain(),
    UpdateMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // CLEAR p1_classifier prefs
    clearPrefs();
  } // end onItemTapped

  late final Future<FirebaseApp> _firebaseInit;
  @override
  void initState() {
    _firebaseInit = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _firebaseInit,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            switch (snapshot.connectionState) {
              // if there is no connection, return a text widget
              case ConnectionState.none:
                return const Center(child: Text('None oh no'));
              // if there is a connection, return a text widget
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      //const Text('Loading . . .'),
                      const Center(
                        child: SpinKitCubeGrid(
                          color: Palette.indigo,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                );
              // if the connection is active, return a text widget
              case ConnectionState.active:
                return const Center(child: Text('App loading in...'));
              // if the connection is done, return a text widget
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                return Stack(
                  children: [
                    Positioned(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: _selectedIndex != 2
                              ? Center(
                                  child: SingleChildScrollView(
                                      child: _widgetOptions
                                          .elementAt(_selectedIndex)))
                              // else if maps, do not place in singlechildscroll view
                              : _widgetOptions.elementAt(_selectedIndex)),
                    ),
                    Positioned(
                      // position the user profile button
                      top: MediaQuery.of(context).size.height * .090,
                      right: MediaQuery.of(context).size.width * .080,
                      child: FloatingActionButton(
                        onPressed: () {
                          // sign out the user
                          // FirebaseAuth.instance.signOut();
                          // navigate to the login page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileMain(),
                            ),
                          );
                        },
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: const Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    // _widgetOptions.elementAt(_selectedIndex)
                  ],
                );
              // : const NearbyMain();
            }
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home'),
          //backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.summarize_outlined),
              activeIcon: Icon(Icons.summarize_rounded),
              label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me_outlined),
              activeIcon: Icon(Icons.near_me_rounded),
              label: 'Nearby'),
          BottomNavigationBarItem(
              icon: Icon(Icons.diversity_1_outlined),
              activeIcon: Icon(Icons.diversity_1_rounded),
              label: 'Companion'),
          BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates_outlined),
              activeIcon: Icon(Icons.tips_and_updates_rounded),
              label: 'Updates'),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 9,
        selectedItemColor: Palette.indigo,
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
