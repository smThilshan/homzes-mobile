import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/models/property_model.dart';
import 'package:homzes/data/repository/property_repository.dart';
import 'package:homzes/presentation/catalog1/bloc/property_bloc.dart';
import 'package:homzes/presentation/catalog1/bloc/property_event.dart';
import 'package:homzes/presentation/catalog1/bloc/property_state.dart';

class Catalog3Screen extends StatelessWidget {
  const Catalog3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      // Providing PropertyBloc to manage property data
      create: (context) => PropertyBloc(
        repository: PropertyRepository(firestore: FirebaseFirestore.instance),
      )..add(LoadProperties()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(screenHeight * 0.12), // Scalable AppBar
          child: AppBar(
            backgroundColor: Colors.green[100],
            elevation: 0,
            toolbarHeight: screenHeight * 0.12,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
            title: Container(
              width: screenWidth * 0.8, // Adaptive width
              height: screenHeight * 0.05, // Adaptive height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.07),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search,
                        color: Colors.black), // Left-aligned search icon
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.left, // Align text to right
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Popular rent offers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                // Using bloc builder to only change needed states
                child: BlocBuilder<PropertyBloc, PropertyState>(
                  builder: (context, state) {
                    if (state is PropertyLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PropertyLoaded) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.properties.length,
                        itemBuilder: (context, index) {
                          return PropertyCard(
                              property: state.properties[index]);
                        },
                      );
                    } else if (state is PropertyError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text("No properties available"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// widget
class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(property.image,
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    _infoTag("${property.bed} Bed"),
                    const SizedBox(width: 5),
                    _infoTag("${property.bathroom} Bathroom"),
                  ],
                ),
              ),
              const Positioned(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(property.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('\$${property.price.toString()} / mo',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(property.location,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 85, 56, 56))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to show small property info tags
  Widget _infoTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
