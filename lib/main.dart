import 'package:chat/Interfaz/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
options: FirebaseOptions(
  apiKey: "AIzaSyDV_yzhtpRBfAmIkg22ud08ImptLeb4ZTg",
  authDomain: "reto3-d4869.firebaseapp.com",
  projectId: "reto3-d4869",
  storageBucket: "reto3-d4869.appspot.com",
  messagingSenderId: "537441471734",
  appId: "1:537441471734:web:5c7f0d92ba9e746fb730d7",
  measurementId: "G-H2BYXJ8ZZ6"));
  runApp(const MyApp());
}


