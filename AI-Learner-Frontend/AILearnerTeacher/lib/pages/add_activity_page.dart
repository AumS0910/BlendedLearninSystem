// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:ai_learner_teacher/components/app_bar.dart';
import 'package:ai_learner_teacher/components/text_field_component.dart';
import 'package:ai_learner_teacher/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AddLearningActivityPage extends StatefulWidget {
  const AddLearningActivityPage({super.key});

  @override
  State<AddLearningActivityPage> createState() =>
      _AddLearningActivityPageState();
}

class _AddLearningActivityPageState extends State<AddLearningActivityPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aimController = TextEditingController();
  final TextEditingController _theoryController = TextEditingController();

  final TextEditingController _videoLinkController = TextEditingController();
  final TextEditingController _conclusionController = TextEditingController();

  // ignore: avoid_init_to_null
  File? _imageFile = null;

  bool isDataValid() {
    if (_titleController.text.isEmpty) {
      showToast(context, "Enter title");
      return false;
    }
    if (_aimController.text.isEmpty) {
      showToast(context, "Enter aim");
      return false;
    }
    if (_theoryController.text.isEmpty) {
      showToast(context, "Enter theory");
      return false;
    }
    if (_videoLinkController.text.isEmpty) {
      showToast(context, "Enter video link");
      return false;
    }
    if (_conclusionController.text.isEmpty) {
      showToast(context, "Enter conclusion");
      return false;
    }
    if (_imageFile == null) {
      showToast(context, "Select image");
      return false;
    }
    return true;
  }

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        log('No image selected.');
      }
    });
  }

  void addCourse() async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://al-learner-backend.onrender.com/course/add'));
      request.fields['title'] = _titleController.text.toString();
      request.fields['aim'] = _aimController.text.toString();
      request.fields['theory'] = _theoryController.text.toString();
      request.fields['videoUrl'] = _videoLinkController.text.toString();
      request.fields['conclusion'] = _conclusionController.text.toString();

      request.files
          .add(await http.MultipartFile.fromPath('image', _imageFile!.path));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        showToast(context, "Course Added Successfully");
        log('Course added successfully');
      } else {
        // Failed to add course
        showToast(context, "Failed to add course: ${response.body}");
        log('Failed to add course: ${response.body}');
      }
    } catch (e) {
      showToast(
          context, "Something went wrong while adding course: ${e.toString()}");
      log('Failed to add course: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Add Learning Activity"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (_imageFile != null)
                GestureDetector(
                  onTap: () => _pickImage(),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    // radius: 64,
                    child: ClipOval(
                      child: Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: () => _pickImage(),
                  child: const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://play-lh.googleusercontent.com/YaU7nJzmMEb-CFj40ME3Gv5-h9cjybd_9rWnZlKoPNUsMQYkCr-8d2nWoEI31TNS8jA"),
                  ),
                ),
              // Container(
              //   width: 95,
              //   height: 95,
              //   decoration: const BoxDecoration(
              //       shape: BoxShape.circle, color: Colors.deepPurple),
              // ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Title",
                textEditingController: _titleController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Aim/Objective",
                textEditingController: _aimController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Theory",
                textEditingController: _theoryController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Video Link",
                textEditingController: _videoLinkController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Conclusion",
                textEditingController: _conclusionController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  addCourse();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.black,
                  backgroundColor: lightPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(double.infinity, 50.0),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _aimController.dispose();
    _theoryController.dispose();
    _videoLinkController.dispose();
    _conclusionController.dispose();
    super.dispose();
  }
}
