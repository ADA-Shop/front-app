import 'package:flutter/material.dart';
import 'package:adaapp/mypage/widgets/custombox.dart';
import 'package:adaapp/mypage/widgets/custombutton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MypagePage extends StatefulWidget {
  const MypagePage({super.key});

  @override
  State<MypagePage> createState() => _MypagePageState();
}

class _MypagePageState extends State<MypagePage> {
  File? _image;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String id = '';
  String profile = '';
  final idchangeController = TextEditingController();
  final profilechangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custombox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.create)
                ),
              ),
            ],
          )
      ),
    );
  }
}
