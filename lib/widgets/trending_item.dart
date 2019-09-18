import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:infotech/util/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  TrendingItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.rating,
  })
      : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {

 

  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
