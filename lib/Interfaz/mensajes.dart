import 'package:chat/Proceso/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
      .collection("chat")
      .orderBy("tiempo", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_consulta,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return respuesta.data?.docs.isEmpty == false
              ? ListView.builder(
                  itemCount: respuesta.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index]
                                  .get("email")
                                  .toString()
                          ? Colors.yellowAccent
                          : Colors.lightBlueAccent,
                      child: ListTile(
                        title: Text(
                          respuesta.data!.docs[index].get("mensaje"),
                          textAlign:
                              (Autenticacion().usuarios?.email).toString() ==
                                      respuesta.data!.docs[index]
                                          .get("email")
                                          .toString()
                                  ? TextAlign.left
                                  : TextAlign.right,
                        ),
                        subtitle: Text(respuesta.data!.docs[index].get("email"),
                            textAlign:
                                (Autenticacion().usuarios?.email).toString() ==
                                        respuesta.data!.docs[index]
                                            .get("email")
                                            .toString()
                                    ? TextAlign.left
                                    : TextAlign.right),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        });
  }
}
