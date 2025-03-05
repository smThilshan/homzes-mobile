import 'package:flutter/material.dart';

class Catalog3Screen extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'image': 'https://source.unsplash.com/random/800x600?house',
      'beds': '3 Beds',
      'baths': '2 Bathroom',
      'title': 'Apartment 4 rooms',
      'location': 'Russia, Moscow',
      'price': '\$1250 /mo',
    },
    {
      'image': 'https://source.unsplash.com/random/800x600?modern-house',
      'beds': '2 Beds',
      'baths': '3 Bathroom',
      'title': 'Apartment 3 rooms',
      'location': 'Russia, Moscow',
      'price': '\$1430 /mo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular rent offers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return PropertyCard(property: properties[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                // child: Image.network(property['image'],
                //     height: 200, width: double.infinity, fit: BoxFit.cover),
                child: Image.asset("assets/images/houseimage2.jpg",
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    _infoTag(property['beds']),
                    SizedBox(width: 5),
                    _infoTag(property['baths']),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child:
                    Icon(Icons.favorite_border, color: Colors.white, size: 30),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(property['title'],
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(property['location'],
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 5),
                Text(property['price'],
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
