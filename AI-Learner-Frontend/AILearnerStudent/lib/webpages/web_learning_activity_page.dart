import 'package:ailearner/components/app_bar.dart';
import 'package:ailearner/models/course_model.dart';
import 'package:ailearner/pages/chat_screen.dart';
import 'package:ailearner/pages/interest_learning_page.dart';
import 'package:ailearner/pages/quiz_page.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/images_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class WebLearningActivityPage extends StatefulWidget {
  WebLearningActivityPage({super.key, required this.course});

  late CourseModel course;

  @override
  State<WebLearningActivityPage> createState() => _WebLearningActivityPageState();
}

class _WebLearningActivityPageState extends State<WebLearningActivityPage> {
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
      flags: const YoutubePlayerFlags(
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
              topicCard(
                "Conclusion",
                widget.course.conclusion,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: veryListGrey,
                    ),
                    child: const ListTile(
                      title: Text(
                        "Take a Quiz",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        CupertinoIcons.arrowtriangle_right_circle,
                        size: 40,
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const InterestBasedLearningPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 120,
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(chatFloatingActionButton),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            alignment: AlignmentDirectional.center,
                            child: const Text(
                              "Interest Learning",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => ChatScreen(
                            courseModel: widget.course,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 120,
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(doubtSolvingAILogo),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            alignment: AlignmentDirectional.center,
                            child: const Text("Doubt Solving AI"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
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
            trailing: isExpanded
                ? const Icon(
                    CupertinoIcons.arrowtriangle_up_circle,
                    size: 40,
                  )
                : const Icon(
                    CupertinoIcons.arrowtriangle_down_circle,
                    size: 40,
                  ),
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
            trailing: isExpanded
                ? const Icon(
                    CupertinoIcons.arrowtriangle_up_circle,
                    size: 40,
                  )
                : const Icon(
                    CupertinoIcons.arrowtriangle_down_circle,
                    size: 40,
                  ),
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
                    progressColors: const ProgressBarColors(
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
