// ignore_for_file: prefer_const_constructors

import 'package:ai_learner_teacher/components/app_bar.dart';
import 'package:ai_learner_teacher/utils/app_colors.dart';
import 'package:ai_learner_teacher/utils/images_name.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/course_model.dart';

// ignore: must_be_immutable
class LearningActivityPage extends StatefulWidget {
  LearningActivityPage({super.key, required this.course});

  late CourseModel course;

  @override
  State<LearningActivityPage> createState() => _LearningActivityPageState();
}

class _LearningActivityPageState extends State<LearningActivityPage> {
  String videoId = "ZmKy_fnRM_E&t=17s";

  late YoutubePlayerController _controller;

  String extractVideoId(String url) {
    RegExp regExp = RegExp(
      r"(?:https:\/\/(?:www\.)?youtube\.com\/watch\?v=|youtu\.be\/)([^\s&]+)",
      caseSensitive: false,
    );

    Match match = regExp.firstMatch(url)!;
    return match.group(1)!;
  }

  @override
  void initState() {
    super.initState();
    String videoId = extractVideoId(widget.course.videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Topic Name"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              topicCard("Title", widget.course.title),
              topicCard("Aim/Objective", widget.course.aim),
              topicCard("Theory", widget.course.theory),
              topicVidoCard("Video", widget.course.videoUrl),
              topicCard("Conclusion", widget.course.conclusion),
            ],
          ),
        ),
      ),
    );
  }

  Widget topicCard(String title, String description) {
    bool isExpanded = false;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: veryListGrey,
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
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget topicVidoCard(String title, String description) {
    bool isExpanded = false;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: veryListGrey,
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
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blueAccent,
                    ),
                    onReady: () {},
                  )),
            ],
          );
        },
      ),
    );
  }
}
