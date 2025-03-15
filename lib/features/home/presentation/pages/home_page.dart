import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: const Text('Hi Alex'),),
        leading: IconButton(onPressed: () {} , icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.supervised_user_circle))],
      ),
      body:  ListView(
        children: <Widget> [


          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: CarouselView(
              itemExtent: 330,
              itemSnapping: true,
              shrinkExtent: 200,
              children: List<Widget>.generate(20, (int index) {
                return Text('hello');
              }),
            ),



          ),

          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 50),
            child: CarouselView(
              itemExtent: 80
              ,
              children: List<Widget>.generate(20, (int index) {
                return Badge(child: Text('hello'),);
              }),
            ),

          )

          ],),);
  }
}
