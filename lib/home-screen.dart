import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foral/model/forum-list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
          child: ForumCard(),
        ),
      ),
    );
  }
}

class ForumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(scrollDirection: Axis.vertical, shrinkWrap: true, itemBuilder: (context, index){
      final Forums forum = forumList[index];
      return Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.network(forum.image, height: 100,),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        forum.title,
                        style: TextStyle(
                            fontFamily: "Roboto-Bold", fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        forum.description,
                        style: TextStyle(
                            fontFamily: "Roboto-Light", fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                forum.author + " | ",
                                style: TextStyle(fontFamily: "Roboto",
                                    fontSize: 12.0),
                              ),
                              Text(
                                forum.date,
                                style: TextStyle(fontFamily: "Roboto-Light",
                                    fontSize: 12.0),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      );
    },
      itemCount: forumList.length,
    );}
}