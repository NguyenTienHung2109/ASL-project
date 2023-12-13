import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserInfo extends StatelessWidget {
  final String documentId;

  GetUserInfo({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection(
        'user_info');
    return Container();

  }
}