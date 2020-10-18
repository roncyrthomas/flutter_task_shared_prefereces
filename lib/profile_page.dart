import 'package:flutter/material.dart';
import 'package:profilepersistent/edit_dat.dart';
import 'package:profilepersistent/user_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    user.readName();
    user.readNumber();
    user.readImage();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: user.getImage(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 120.0, left: 110.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 20,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              user.pickImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20.0,
                  width: 300,
                  child: Divider(
                    color: Colors.grey[600],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      title: Text(
                        user.getName(),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        color: Colors.white,
                        iconSize: 20,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: EditData(
                                  isNAme: true,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  color: Colors.grey[800],
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                  color: Colors.grey[800],
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      title: Text(
                        user.getNumber().toString(),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        color: Colors.white,
                        iconSize: 20,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: EditData(
                                  isNAme: false,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  child: Text("Reset"),
                  onPressed: () {
                    user.reset();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
