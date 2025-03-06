import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/repository/property_repository.dart';
import 'package:homzes/presentation/catalog1/bloc/property_bloc.dart';
import 'package:homzes/presentation/catalog1/pages/catalog1_screen.dart';
import 'package:homzes/presentation/catalog3/pages/catalog3_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyBloc(
          repository:
              PropertyRepository(firestore: FirebaseFirestore.instance)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Catalog3Screen(),
      ),
    );
  }
}
