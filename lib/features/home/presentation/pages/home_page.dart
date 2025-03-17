import 'package:flutter/material.dart';
import 'package:retailpi/features/home/presentation/pages/sample_data.dart';
import 'package:retailpi/features/home/presentation/widgets/group_badge.dart';
import 'package:retailpi/features/home/presentation/widgets/home_recent_tabs.dart';
import 'package:retailpi/features/home/presentation/widgets/notes_section.dart';
import 'package:retailpi/features/home/presentation/widgets/shorcut_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: const Text('Hi Alex'),
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.supervised_user_circle))
        ],
      ),
      body: Column(
        children: <Widget>[
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
          HomeShortcuts(),
          Flexible(fit: FlexFit.loose, child: RecentTabs()),
          SizedBox(
            height: 40,
            child: GroupBadgeList(
              groups: [
                {'id': '1', 'name': 'Group A'},
                {'id': '2', 'name': 'Group B'},
                {'id': '3', 'name': 'Group C'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
                {'id': '4', 'name': 'Group D'},
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: NotesSection())
        ],
      ),
    );
  }
}
