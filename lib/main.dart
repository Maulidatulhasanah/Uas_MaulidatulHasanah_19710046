import 'package:flutter/material.dart';
import 'package:app_berita_19710046/splashscreen_view.dart';
import 'package:app_berita_19710046/components/customListTile.dart';
import 'package:app_berita_19710046/model/article_model.dart';
import 'package:app_berita_19710046/services/api_service.dart';
import 'package:app_berita_19710046/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        'halaman': (BuildContext context) => new halaman(),
        'technology': (BuildContext context) => new HomePage1(),
        'sport': (BuildContext context) => new HomePage2(),
        'profile': (BuildContext context) => new HomePage3(),
      },
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  berita_tecno createState() => berita_tecno();
}

class berita_tecno extends State<HomePage1> {
  ApiService_tecno client = ApiService_tecno();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title:
              Text("Technology Updates", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  berita_sport createState() => berita_sport();
}

class berita_sport extends State<HomePage2> {
  ApiService_sport client = ApiService_sport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: Text("Sport Updates", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black12),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomePage3 extends StatefulWidget {
  @override
  profile createState() => profile();
}

class profile extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("Profile"),
            backgroundColor: Colors.black12,
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/img/Maulida.jpg'),
              ),
              Text(
                'Universitas Islam Kalimantan MAB',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.account_circle_outlined, color: Colors.black),
                  title: Text(
                    'MAULIDATUL HASANAH',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.assignment_ind_outlined, color: Colors.black),
                  title: Text(
                    '19710046',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.school_outlined, color: Colors.black),
                  title: Text(
                    '5A SI REG PAGI BJM',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    left: 25.0, top: 25.0, right: 25.0, bottom: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.contact_phone_outlined, color: Colors.black),
                  title: Text(
                    '+6285751627959',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home_outlined, color: Colors.black),
                  title: Text(
                    'Banjarmasin, jl. kelayan A Gg 12 Rt 21 Rw 02 No 10',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
