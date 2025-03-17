import 'package:flutter/material.dart';
import 'package:retailpi/features/home/presentation/pages/sample_data.dart';

class HomeShortcuts extends StatelessWidget {
  const HomeShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: SampleShortcuts.items.length,
        itemBuilder: (context, index) {
          final item = SampleShortcuts.items[index];
          return GestureDetector(
            onTap: () => {}
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => item['page']),
            // ),
            ,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    // backgroundColor: Colors.blueAccent,
                    child: Icon(
                      Icons.book,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(SampleShortcuts.items[index],
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
