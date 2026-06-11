import 'package:adaapp/product/screens/myproductpage.dart';
import 'package:adaapp/splash/screens/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:adaapp/mypage/widgets/custombox.dart';
import 'package:adaapp/mypage/widgets/mypagebutton.dart';
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
      body: SingleChildScrollView(
        child: Custombox(
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
                                title: Text(
                                    '프로필 수정',
                                  style: TextStyle(
                                    fontWeight: .bold,
                                    fontSize: 18,
                                  ),
                                ),
                                content: SizedBox(
                                  width: 5000,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                          '아이디',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15
                                        ),
                                      ),
                                      TextField(
                                        controller: idchangeController,
                                        style: TextStyle(
                                          fontSize: 14
                                        ),
                                      ),
                                      SizedBox(height: 25,),
                                      Text(
                                        '자기소개',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        ),
                                      ),
                                      TextField(
                                        controller: profilechangeController,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 14,
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
                                          fontWeight: .bold,
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
                                          fontWeight: .bold,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            id,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            profile,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Mypagebutton(
                    onTap: (){
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => Myproductpage())
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    text: '내 상품'
                ),
                Mypagebutton(
                    onTap: (){},
                    icon: Icon(Icons.receipt),
                    text: '구매내역'
                ),
                Mypagebutton(
                    onTap: (){},
                    icon: Icon(Icons.money),
                    text: '판매내역'
                ),
                Divider(color: Colors.grey[200],),
                SizedBox(height: 70,),
                Mypagebutton(
                    onTap: (){
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   width: .infinity,
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     borderRadius: .circular(10),
                      //     color: Colors.white
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: .start,
                      //     children: [
                      //       Text(
                      //           '정말 로그아웃 하시겠습니까 ?',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 18,
                      //         ),
                      //       ),
                      //       Text(
                      //         '로그아웃시 회원 정보 일부가 날라갈 수 있습니다.',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //       Row(
                      //         children: [
                      //           TextButton(
                      //               onPressed: (){
                      //                 Navigator.pop(context);
                      //               },
                      //               child: Text('취소')
                      //           ),
                      //           TextButton(
                      //               onPressed: (){
                      //                 Navigator.pushReplacement(
                      //                     context,
                      //                     MaterialPageRoute(builder: (context) => LoginPage())
                      //                 );
                      //               },
                      //               child: Text('확인')
                      //           )
                      //         ],
                      //       ),
                      //     ],
                      //   )
                      // );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    },
                    icon: Icon(Icons.outbound_outlined),
                    text: '로그아웃'
                ),
              ],
            )
        ),
      ),
    );
  }
}
