import 'dart:async';
import 'package:adaapp/Home/screens/Home_Page.dart';
import 'package:adaapp/add/widgets/catebutton.dart';
import 'package:adaapp/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class MyItem {
  final String name;
  final String price;
  final String description;
  final ControllerCallback controller;

  MyItem({
    required this.name,
    required this.price,
    required this.description,
    required this.controller,
  });
}

class _AddPageState extends State<AddPage> {
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();

  List<String> cates = [
    '전자기기',
    '패션/의류',
    '식품/생필품',
    '도서/서적',
    '기타'
  ];

  List selectcate = [];

  List<File> images = [];
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget inputField(String title, String hint,TextEditingController controller,{int maxLines = 1}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20,left: 20,top: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20, right: 20, bottom: 15, top: 10),
            padding: EdgeInsets.only(left: 10),
            height: maxLines == 1 ? 50 : 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 14
              ),
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 14,
                )
              ),
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '상품등록',
          style: TextStyle(
            fontWeight: .bold
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: getImage,
                    child: Container(
                      height: double.infinity,
                      width: 170,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(Icons.add_circle, color: Colors.grey),
                    ),
                  ),
                  ...images.map((img) {
                    return Container(
                      height: double.infinity,
                      width: 170,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: FileImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                    '카테고리',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .w600
                  ),
                ),
                SizedBox(height: 7,),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cates.length,
                      itemBuilder: (context,index) {
                        final cate = cates[index];

                        final selected = selectcate.contains(cate);

                        return Catebutton(
                            text: cate,
                            selected: selected,
                            onTap: (){
                              setState(() {
                                if(selected) {
                                  selectcate.remove(cate);
                                }
                                else {
                                  selectcate.add(cate);
                                }
                              });
                            }
                        );
                      }
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),

          inputField('상품명', '상품명을 입력하세요',namecontroller),
          inputField('가격', '가격을 입력하세요',pricecontroller),
          inputField('설명', '설명을 입력하세요',descriptioncontroller, maxLines: 5),

          SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                if (namecontroller.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('상품명을 입력해주세요'))
                  );
                }
                else if (pricecontroller.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('가격을 입력해주세요'))
                  );
                }
                else if (descriptioncontroller.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('설명을 입력해주세요'))
                  );
                }
                else {
                  namecontroller.clear();
                  pricecontroller.clear();
                  descriptioncontroller.clear();
                  selectcate.clear();

                  Navigator.pushReplacement(
                      context,
                    MaterialPageRoute(builder: (context) => Adaapp())
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                '등록하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
