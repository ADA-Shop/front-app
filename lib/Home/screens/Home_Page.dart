import 'package:adaapp/Category/screens/Category_Page.dart';
import 'package:adaapp/add/screens/add_page.dart';
import 'package:adaapp/mypage/screens/MyPage_page.dart';
import 'package:flutter/material.dart';
import 'package:adaapp/Home/widgets/customselectionbox.dart';
import 'package:adaapp/Home/widgets/customcategorybutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdmin = true;
  int currentIndex = 0;
  List<String> ManualList = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget productItem(int index) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.grey[200],
                child: const Center(child: Text('이미지')),
              ),
              const SizedBox(height: 10),
              Text('상품 ${index + 1}'),
            ],
          ),
        ),
      );
    }
    Widget HomePage = ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:15,left: 10,right: 10),
              padding: EdgeInsets.all(40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('나만의 상점을 열어보세요',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight(800)
                    ),
                  ),
                  Text('중고거래와 상점 운영을 한번에 할 수 있는 플랫폼',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight(500),
                    ),
                  ),
                ],
              ),
            ),
            Customselectionbox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('카테고리',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Customcategorybutton(text: '전체'),
                            Customcategorybutton(text: '전자기기'),
                            Customcategorybutton(text: '패션/의류'),
                            Customcategorybutton(text: '식품/생필품'),
                            Customcategorybutton(text: '도서/서적'),
                            Customcategorybutton(text: '기타'),
                          ],
                        )
                    ),
                  ],
                ),
            ),
            Customselectionbox(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('공지사항',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight(800),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isAdmin)
                      Column(
                        children: [
                          TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: '공지를 입력하세요',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ManualList.add(controller.text);
                                controller.text = '';
                              });
                            },
                            child: Text('공지작성'),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: ManualList.length,
                        itemBuilder: (context, index) {
                          return Text('● 공지${index+1}: ${ManualList[index]}');
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),),
            Customselectionbox(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('상품목록',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight(800),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,

                  ),
                  itemBuilder: (context, index) => productItem(index),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CategoryPage(initialCategory: '전체'))
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Text('더보기',style: TextStyle(color: Colors.black, fontSize: 13),),
                    ),

                  ),
                ),
              ],
            ),),
          ],
        ),
      ],
    );

    final pages = [
      HomePage,
      CategoryPage(initialCategory: '전체',),
      AddPage(),
      Center(child: Text('채팅')),
      MypagePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('중고상점',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight(800)
          ),
        ),
        centerTitle: false,
        titleSpacing: 30.0,
        actions: [
          IconButton(onPressed: (){
            setState(() {
            });
          }, icon: Icon(Icons.notifications)),
          IconButton(onPressed: (){
            setState(() {
            });
          }, icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.white,
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.menu),label:'카테고리'),
          BottomNavigationBarItem(
            icon: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: '마이페이지'),
        ],
      ),
    );
  }
}
