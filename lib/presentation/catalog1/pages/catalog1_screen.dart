import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: 'Featured'),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredProperties.length,
                        itemBuilder: (context, index) {
                          return PropertyCard(
                              property: featuredProperties[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SectionHeader(title: 'New Offers'),
                    SizedBox(height: 20),
                    // PropertyCard(property: newOffers.first, isLarge: true),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newOffers.length,
                          itemBuilder: (context, index) {
                            return PropertyCard(
                                property: newOffers[index], isLarge: true);
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.yellow.shade200,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.black),
                Text("Hi, Stanislav",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                CircleAvatar(
                    backgroundColor: Colors.grey.shade400, child: Text("S"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Karanna",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'View all',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Property property;
  final bool isLarge;

  const PropertyCard({super.key, required this.property, this.isLarge = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12, top: 8),
      width: isLarge ? MediaQuery.of(context).size.width * 0.9 : 150,
      height: isLarge ? 220 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          // image: NetworkImage(property.imageUrl),
          image: AssetImage("assets/images/house_image1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                property.price != null ? '\$${property.price}' : 'N/A',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Property {
  final String imageUrl;
  final String title;
  final double price;

  Property({required this.imageUrl, required this.title, required this.price});
}

final List<Property> featuredProperties = [
  Property(
      imageUrl: 'https://source.unsplash.com/200x200/?house1',
      title: 'Apartment 3 rooms',
      price: 580),
  Property(
      imageUrl: 'https://source.unsplash.com/200x200/?house2',
      title: 'Apartment 4 rooms',
      price: 750),
  Property(
      imageUrl: 'https://source.unsplash.com/200x200/?house2',
      title: 'Apartment 4 rooms',
      price: 750),
  Property(
      imageUrl: 'https://source.unsplash.com/200x200/?house2',
      title: 'Apartment 4 rooms',
      price: 750),
  Property(
      imageUrl: 'https://source.unsplash.com/200x200/?house2',
      title: 'Apartment 4 rooms',
      price: 750),
];

final List<Property> newOffers = [
  Property(
      imageUrl: 'https://source.unsplash.com/400x300/?house3',
      title: 'Apartment 3 rooms',
      price: 1250),
  Property(
      imageUrl: 'https://source.unsplash.com/400x300/?house3',
      title: 'Apartment 3 rooms',
      price: 1250),
  Property(
      imageUrl: 'https://source.unsplash.com/400x300/?house3',
      title: 'Apartment 3 rooms',
      price: 1250),
  Property(
      imageUrl: 'https://source.unsplash.com/400x300/?house3',
      title: 'Apartment 3 rooms',
      price: 1250),
  Property(
      imageUrl: 'https://source.unsplash.com/400x300/?house3',
      title: 'Apartment 3 rooms',
      price: 1250),
];
