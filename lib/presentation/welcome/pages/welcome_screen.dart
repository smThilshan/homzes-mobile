import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Align(
      //     alignment: Alignment.centerLeft,
      //     child: Text(
      //       "Homzes",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         // color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.menu, color: Colors.black),
      //       onPressed: () {
      //         // Handle menu button press
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            // child: Image.network(
            //   'https://source.unsplash.com/800x1200/?modern-house', // Replace with an asset if needed
            //   fit: BoxFit.cover,
            // ),
            child: Image.asset(
              'assets/images/house_image1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Dark overlay for readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Homzes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Spacer(),
                  // Welcome Text
                  Text(
                    'Find the best place for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Options
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _optionCard(Icons.chair, 'Rent', Colors.brown[100]!),
                        _optionCard(Icons.apartment, 'Buy', Colors.green[100]!),
                        _optionCard(Icons.apartment, 'Buy', Colors.green[100]!),
                        _optionCard(Icons.apartment, 'Buy', Colors.green[100]!),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Create Account Button
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Create an account',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _optionCard(IconData icon, String title, Color color) {
  // return Expanded(
  // child: Container(
  //       height: 100,
  //       margin: EdgeInsets.symmetric(horizontal: 5),
  //       decoration: BoxDecoration(
  //         color: color,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icon, size: 30, color: Colors.black54),
  //           SizedBox(height: 5),
  //           Text(
  //             title,
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _optionCard(IconData icon, String title, Color color) {
    return Container(
      width: 180, // Adjust the width as needed
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.black54),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
