import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("About Us"),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/kandy_casa_logo.jpg"),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Powered by",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 14,
                ),
                Image.asset(
                  "assets/images/vrl_logo.png",
                  width: 180,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "www.vrlabs.lk",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
