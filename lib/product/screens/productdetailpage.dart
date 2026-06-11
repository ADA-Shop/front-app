import 'package:flutter/material.dart';

class Productdetailpage extends StatelessWidget {
  final int index;
  
  const Productdetailpage({
    super.key,
    required this.index,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: 200,
                  width: .infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: .circular(10)
                  ),
                  child: Center(
                    child: Text('이미지'),
                  ),
                ),
                Text(
                    '상품 ${index + 1}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '~~상품 설명 ~~',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
