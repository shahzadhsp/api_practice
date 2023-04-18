import 'package:api_practice/api_class.dart';
import 'package:api_practice/modal_class.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserApiService service = UserApiService();
  late Future<List<ModelClass>> list;
  @override
  void initState() {
    super.initState();
    list = service.fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Practice'),
        ),
        body: FutureBuilder(
          future: list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 40,
                    color: Colors.pink[100],
                    margin: EdgeInsets.fromLTRB(8.0,16.0,8,8),
                    borderOnForeground: true,
                    shadowColor: Colors.black38,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Column(
                      children: [
                        FittedBox(
                            child: Text(
                          'Name: ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )),
                        FittedBox(
                            child: Text(snapshot.data![index].name.toString())),
                        Text(
                          'UserName: ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        FittedBox(
                            child: Text(
                                snapshot.data![index].username.toString())),
                        FittedBox(
                            child: Text(
                          'Email: ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )),
                        FittedBox(
                            child:
                                Text(snapshot.data![index].email.toString())),
                        Text(
                          'City: ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(snapshot.data![index].address!.city.toString()),
                        Text(
                          'Geo: ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            snapshot.data![index].address!.geo!.lat.toString()),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ReusableRow extends StatelessWidget {
  String title;
  String value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
      ),
    );
  }
}
