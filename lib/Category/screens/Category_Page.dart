import 'package:adaapp/product/screens/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:adaapp/Category/widgets/customcategorybutton.dart';

class CategoryPage extends StatefulWidget {

  final String initialCategory;

  const CategoryPage({
    super.key,
    required this.initialCategory,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  late String selectCategory;

  @override
  void initState() {
    super.initState();
    selectCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '카테고리',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Customcategorybutton(
                  text: '전체',
                  onTap: () {
                    setState(() {
                      selectCategory = '전체';
                    });
                  },
                ),
                Customcategorybutton(
                  text: '전자기기',
                  onTap: () {
                    setState(() {
                      selectCategory = '전자기기';
                    });
                  },
                ),
                Customcategorybutton(
                  text: '패션/의류',
                  onTap: () {
                    setState(() {
                      selectCategory = '패션/의류';
                    });
                  },
                ),
                Customcategorybutton(
                  text: '식품/생필품',
                  onTap: () {
                    setState(() {
                      selectCategory = '식품/생필품';
                    });
                  },
                ),
                Customcategorybutton(
                  text: '도서/서적',
                  onTap: () {
                    setState(() {
                      selectCategory = '도서/서적';
                    });
                  },
                ),
                Customcategorybutton(
                  text: '기타',
                  onTap: () {
                    setState(() {
                      selectCategory = '기타';
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Productdetailpage(index: index))
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$selectCategory 상품 ${index + 1}',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}