import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'components/Category.dart';
import 'components/appbar.dart';
import 'components/sorting.dart';
import 'package:edu_expo/models/user_student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //bottom bar
      //we used bottom bar package baad m hatinech fi pubspec
      bottomNavigationBar: BottomNavyBar(
   selectedIndex: _selectedIndex,
   showElevation: true, // use this to remove appBar's elevation
   onItemSelected: (index) => setState(() {
              _selectedIndex = index;
    }),
   items: [
    BottomNavyBarItem(
       icon: Icon(Icons.apps),
       title: Text('Home'),
       activeColor: Colors.red,
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.people),
         title: Text('Users'),
         activeColor: Colors.purpleAccent
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.message),
         title: Text('Messages'),
         activeColor: Colors.pink
     ),
     BottomNavyBarItem(
         icon: Icon(Icons.settings),
         title: Text('Settings'),
         activeColor: Colors.blue
     ),
   ],
),
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          Text(
                            "hi user", 
                            style: TextStyle(
                              fontSize: 28, 
                              fontWeight: FontWeight.bold,
                              ),
                              ),
                          SizedBox(
                            height: 10,
                          ),

                          Text("welcome back to your account",
                              style: TextStyle(
                               color: Colors.black54,
                               wordSpacing: 2.5,
                               //height: 1.5,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             ),
                             ),
                        ],
                        
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(15.0)),
                            child: Image.asset("assets/images/salut.png"),
                          )
                          
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // sorting 
                  Sorting(),
                   const SizedBox(
                    height:20,
                  ),
                  
                  //category list
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    InkWell(
                     // onTap:() {},
                      child: Text(
                        "see all", 
                      style: TextStyle(fontSize:16, color: Colors.blue),
                      )
                  
                    ),
                  
                   ],
                 ),
                  //now we create model of our umages and colors which we will
                 const SizedBox(
                    height:20,
                  ),
                //we can't use gridview inside column
                //use shrinkwrap and physical scroll
                CategoryList(),
                 const SizedBox(
                    height: 20,
                  ),
                
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
