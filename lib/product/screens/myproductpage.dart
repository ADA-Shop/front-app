import 'package:adaapp/product/screens/myproductdetailpage.dart';
import 'package:flutter/material.dart';

class Myproductpage extends StatefulWidget {
  const Myproductpage({super.key});

  @override
  State<Myproductpage> createState() => _MyproductpageState();
}

class _MyproductpageState extends State<Myproductpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '내 상품 관리',
          style: TextStyle(
            fontWeight: .bold
          ),
        ),
      ),
      body: ListView.builder(
        // itemcount -> 백엔드 붙이면 그때 상품 갯수로 바꾸기
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myproductdetailpage(index: index))
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: .circular(14),
                  color: Colors.white
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                          'title ${index+1}',
                        style: TextStyle(
                          fontWeight: .bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'content ${index + 1}',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
