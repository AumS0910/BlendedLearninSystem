import 'package:ailearner/components/app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/images_name.dart';

class SelectSubjectPage extends StatefulWidget {
  const SelectSubjectPage({super.key});

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Select Subject"),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            showInformation(
                "Computer Algorithms",
                [
                  topicCard("Dynamic Programming"),
                  topicCard("Dynamic Programming"),
                  topicCard("Dynamic Programming"),
                  topicCard("Object Oriented Programming"),
                ],
                true),
            showInformation(
                "Data Structure",
                [
                  topicCard("Array"),
                  topicCard("Stack"),
                  topicCard("Link List"),
                  topicCard("Graph"),
                ],
                false),
          ],
        ),
      ),
    );
  }

  Widget showInformation(String title, List<Widget> children, bool isExpanded) {
    return Card(
      elevation: 0.5,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightGreyColor,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return ExpansionTile(
                trailing:
                    isExpanded ? Image.asset(arrowUp) : Image.asset(arrowDown),
                onExpansionChanged: (expanded) {
                  setState(() {
                    isExpanded = expanded;
                  });
                },
                initiallyExpanded: isExpanded,
                expansionAnimationStyle: AnimationStyle(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 300),
                ),
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 24),
                ),
                children: children);
          },
        ),
      ),
    );
  }

  Widget topicCard(String title) {
    return Container(
      width: double.infinity,
      height: 75,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: veryListGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
