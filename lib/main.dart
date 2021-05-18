import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_sub_drawer/imageshow.dart';
import 'package:material_sub_drawer/imageslider.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:multilevel_drawer/multilevel_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
          header: Container(
            // Header for Drawer
            height: size.height * 0.25,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  "http://tecmac.in/images/avatar1.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("User")
              ],
            )),
          ),
          children: [
            MLMenuItem(
                leading: Icon(Icons.task),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "My Tasks",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => imageslider()));
                      },
                      submenuContent: Text("Image Slider")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => imageshow()));
                      },
                      submenuContent: Text("Image Viewer")),

                  // MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                ],
                onClick: () {}),
          ],
        ),

        appBar: AppBar(
          backgroundColor: const Color(0xff1F618D),
          title: Text("Image Loading"),
          centerTitle: true,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color(0xff1F618D),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(
                    top: 20, start: 30, end: 30, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                child: Text("Image loading  from  URL"),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                child: Text("Rounded Image view from url"),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
