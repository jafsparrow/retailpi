import 'package:flutter/material.dart';

class GroupBadgeList extends StatelessWidget {
  final List<Map<String, String>> groups;

  const GroupBadgeList({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Horizontal ListView
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final group = groups[index];
              final groupId = group['id']!;
              final groupName = group['name']!;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: GroupBadge(
                  groupName: groupName,
                  onTap: () {
                    // Show SnackBar with the group ID
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Group ID: $groupId'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        TextButton(onPressed: () {}, child: Text('show more'))
      ],
    );
  }
}

class GroupBadge extends StatelessWidget {
  final String groupName;
  final VoidCallback onTap;

  const GroupBadge({Key? key, required this.groupName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle badge tap
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.blue.shade50, // Light blue background
          borderRadius: BorderRadius.circular(20), // Rounded corners
          border: Border.all(color: Colors.blue.shade200), // Border color
        ),
        child: Text(
          groupName,
          style: TextStyle(
            color: Colors.blue.shade800, // Dark blue text
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
