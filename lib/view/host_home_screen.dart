import 'package:flutter/material.dart';
import 'package:property_rental_app/view/guestScreens/account_screen.dart';
import 'package:property_rental_app/view/guestScreens/explore_screen.dart';
import 'package:property_rental_app/view/guestScreens/inbox_screen.dart';
import 'package:property_rental_app/view/guestScreens/save_listing_screen.dart';
import 'package:property_rental_app/view/guestScreens/trips_screen.dart';
import 'package:property_rental_app/view/hostScreens/booking_screen.dart';
import 'package:property_rental_app/view/hostScreens/my_posting_screen.dart';

class HostHomeScreen extends StatefulWidget {

  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

class _HostHomeScreenState extends State<HostHomeScreen> {

  int selectedIndex = 0;

  final List<String> screenTitles = [
    'Booking',
    'My Postings',
    'Inbox',
    'Profile'
  ];

  final List<Widget> screens = [
    BookingScreen(),
    MyPostingScreen(),
    InboxScreen(),
    AccountScreen()
  ];

  BottomNavigationBarItem customBottomNavigationBarItem(int index, IconData iconData, String title){
    return BottomNavigationBarItem(
        icon: Icon(iconData,
          color: Colors.black,),
        activeIcon: Icon(iconData,
          color: Colors.deepPurple,),
        label: title
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.pinkAccent,
                    Colors.amber
                  ],
                  begin: FractionalOffset(0,0),
                  end: FractionalOffset(1,0),
                  stops: [0,1],
                  tileMode: TileMode.clamp
              )
          ),
        ),
        title: Text(screenTitles[selectedIndex],
          style: const TextStyle(
              fontSize: 18,
              color: Colors.white
          ),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          setState(() {
            selectedIndex = i;
          });
        },

        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          customBottomNavigationBarItem(0, Icons.calendar_today, screenTitles[0]),
          customBottomNavigationBarItem(1, Icons.home, screenTitles[1]),
          customBottomNavigationBarItem(2, Icons.message, screenTitles[2]),
          customBottomNavigationBarItem(3, Icons.person_outline, screenTitles[3]),
        ],
      ),
    );
  }
}
