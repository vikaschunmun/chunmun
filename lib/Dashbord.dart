import 'package:chunmun/index.dart';
import 'package:chunmun/main.dart';
import 'package:chunmun/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBord extends StatefulWidget {
  String subject;

  DashBord({this.subject});
  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {



  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget mbody;
    switch(_index){

      case 0 : mbody = new IndexPage();
      break;
      case 1 : mbody = new LivePage();
      break;
      case 2 : mbody = new Videos();
      break;
      case 3 : mbody = new Message();
      break;
      case 4 : mbody = new UserInfoPage();
      break;

    }

    return Scaffold(
      body: mbody,
      bottomNavigationBar: BottomNavigationBar(onTap: (newIndex) => setState(()=>_index = newIndex),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.group_work,color: Colors.black,),title: Text("items")),
          BottomNavigationBarItem(icon: Icon(Icons.wifi_tethering,color: Colors.black,),title: Text("chat")),
          BottomNavigationBarItem(icon: Icon(Icons.video_library,color: Colors.black,),title: Text("Cart")),
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Colors.black,),title: Text("Costumers")),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),title: Text("Profile"))


        ], backgroundColor: Colors.black12,),
    );

  }
}

class LivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Live"),
      ),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('videos').snapshots() ,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');
          return new ListView(
            children: snapshot.data.documents.map((document) {
              return new ListTile(
                title: new Text(document['url']),
                onTap: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=> VideoPage(url: document['url'],)),),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("videos"),
    ));
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("massage"),
    ));
  }
}

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Me"),
    ));
  }
}







