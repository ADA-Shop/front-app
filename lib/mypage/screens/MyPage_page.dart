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

  String id = 'user';
  String profile = 'user profile';
  final idchangeController = TextEditingController();
  final profilechangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '마이페이지',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Custombox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text('프로필 수정'),
                              content: SizedBox(
                                width: 5000,
                                height: 200,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: idchangeController,
                                      decoration: InputDecoration(
                                        labelText: '아이디',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    TextField(
                                      controller: profilechangeController,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          labelText: '자기소개',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                        '취소',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                ),
                                TextButton(
                                    onPressed: (){
                                      setState(() {
                                        id = idchangeController.text;
                                        profile = profilechangeController.text;
                                      });

                                      idchangeController.clear();
                                      profilechangeController.clear();

                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                        '수정',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                ),
                              ],
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.create)
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                      _image != null ? FileImage(_image!) : null,
                      child: _image == null ? Icon(Icons.camera_alt,color: Colors.blue,) : null,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        id,
                        style: TextStyle(
                          fontSize: 24,
                            fontWeight: .bold
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        profile,
                        style: TextStyle(
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
