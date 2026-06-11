import 'package:flutter/material.dart';

class Myproductdetailpage extends StatefulWidget {
  final int index;

  const Myproductdetailpage({
    super.key,
    required this.index,
  });

  @override
  State<Myproductdetailpage> createState() => _MyproductdetailpageState();
}

class _MyproductdetailpageState extends State<Myproductdetailpage> {
  final deletecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){
                // 값들은 나중에 연결하면 그때 변경
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                            '상품을 삭제하시려구요 ㅜ>ㅜ ?',
                          style: TextStyle(
                            fontWeight: .bold,
                            fontSize: 18,
                          ),
                        ),
                        content: SizedBox(
                          height: 300,
                          width: 5000,
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                '상품 삭제시 주의사항',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                '• 상품을 삭제하면 다시 되돌릴 수 없어요',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13
                                ),
                              ),
                              Text(
                                '• 상품을 찾는 사람이 있을지도 몰라요 !',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13
                                ),
                              ),
                              SizedBox(height: 25,),
                              Text(
                                '삭제를 원하시나요 ?',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  fontWeight: .bold
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(10),
                                  color: Colors.red.withOpacity(0.2),
                                ),
                                child: TextField(
                                    controller: deletecontroller,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontWeight: .bold
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'title 1', // 이거 상품 이름이랑 똑같이 해야 지워지게
                                        hintStyle: TextStyle(
                                          color: Colors.red,
                                          fontWeight: .bold
                                        ),
                                        border: .none
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
                                  fontWeight: .bold,
                                  color: Colors.red,
                                ),
                              )
                          ),
                          TextButton(
                              onPressed: (){
                                // 유효성 검사 ... 구현 하자요
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  fontWeight: .bold,
                                  color: Colors.red,
                                ),
                              )
                          ),
                        ],
                      );
                    }
                );
              },
              icon: Icon(Icons.delete_outline)
          )
        ],
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
                  'title ${widget.index + 1}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '~~상품 설명 ~~',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
