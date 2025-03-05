import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homzes/presentation/catalog1/pages/catalog1_screen.dart';
import 'package:homzes/presentation/catalog3/pages/catalog3_screen.dart';
import 'package:homzes/presentation/welcome/pages/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Catalog3Screen(),
    );
  }
}

class AttractionListScreen extends StatelessWidget {
  final CollectionReference attractions =
      FirebaseFirestore.instance.collection('attraction');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attractions")),
      body: StreamBuilder<QuerySnapshot>(
        stream: attractions.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No attractions found"));
          }

          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var data = docs[index].data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(data['image'], width: 50, height: 50),
                  title: Text(data['title']),
                  subtitle: Text(data['short-detail']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
