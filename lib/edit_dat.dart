import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_viewmodel.dart';

class EditData extends StatelessWidget {
  String data;
  final bool isNAme;
  EditData({this.isNAme});
  final myController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 30.0,
            left: 50.0,
            right: 50.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'EDIT DATA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  data = value;
                },
              ),
              FlatButton(
                color: Colors.grey[700],
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if (data != null) {
                    if (isNAme) {
                      Provider.of<User>(context, listen: false)
                          .updateName(data);
                    } else {
                      Provider.of<User>(context, listen: false)
                          .updateNumber(int.parse(data));
                    }
                  }

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
