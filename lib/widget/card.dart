import 'package:flutter/material.dart';

customeCard() {
  return Container(
    height: 150,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.green.shade300,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.check),
            title: Text('User Name'),
            subtitle: Text('User Type'),
            trailing: FlutterLogo(size: 100),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Skill 0'),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Skill 1'),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Skill 2'),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Skill 3'),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
