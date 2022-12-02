import 'package:chat/Interfaz/mensajes.dart';
import 'package:chat/Proceso/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;
final foco = FocusNode();

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((Autenticacion().usuarios?.email).toString()),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            Row(
              children: [
              Expanded(
                child: TextField(
                  focusNode: foco,
                  controller: mensaje,
                  decoration: InputDecoration(
                    hintText: "Mensaje Chats",
                    ),
                    onSubmitted: (valor) {
                      foco.requestFocus(); 
                      if (mensaje.text.isNotEmpty) {
                        mensaje.text = valor;
                        fire.collection("chat").doc().set({
                          "mensaje": mensaje.text,
                          "tiempo": DateTime.now(),
                          "email": Autenticacion().usuarios?.email
                        });

                        mensaje.clear();
                      }
                    },
                  ),
                ), 
            IconButton(onPressed: () {

              if(mensaje.text.isNotEmpty) {
                fire.collection("chat").doc().set({
                "mensaje":mensaje.text,
                "tiempo":DateTime.now(),
                "email":Autenticacion().usuarios?.email
              });

              mensaje.clear();
              }
            }, icon: Icon(Icons.send_outlined))
            ],
            ),
            Container(
              child: Expanded(child: mensajes()),
            )
          ],
        ),
      ),
    );
  }
}