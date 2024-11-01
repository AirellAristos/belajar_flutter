import 'package:belajar_flutter/models/category_models.dart';
import 'package:belajar_flutter/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
    List<CategoryModels> categories = [];
    List<NewsModels> news = [];

    @override
    void initState() {
      super.initState();
      _getInitialInfo();
    }

    void _getInitialInfo() {
      setState(() {
        categories = CategoryModels.getCategories();
        news = NewsModels.getNews();
      });
    }

@override
Widget build(BuildContext context) {
  _getInitialInfo();
  return Scaffold(
    appBar:buildAppBar(),
    backgroundColor: Colors.white,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchBar(),
        SizedBox(height: 40,),
        _listSection(),
        SizedBox(height: 40,),
        _newsSection()
      ],
    ),
  );
}

//Metode Untuk Membuat News
Column _newsSection() {
  return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20),
            child: Text("News\nTo Read",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 15,),
            Container(
              height: 266,
              child: ListView.separated(
                scrollDirection: Axis.horizontal, 
                itemCount: news.length, 
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: news[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(news[index].name,
                                  style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(news[index].news),
                          ),

                          Text(news[index].duration + " | " + news[index].newsType,
                            style: TextStyle(
                              color: Color(0xff7B6D72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            )),

                          Container(
                            height: 45,
                            width:130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                              colors: [
                                Color(0xff9DCEFF),
                                Color(0xff92A3FD)
                              ])
                            ),
                            child: 
                            Center(
                              child: Text("View",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      );
}

// Metode Untuk Membuat List
Column _listSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 28),
        child: Text(
          "List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 15),
      Container(
        height: 120,
        child: ListView.separated(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 20, right: 20),
          separatorBuilder: (context, index) => SizedBox(width: 25),
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                print('Tombol ${categories[index].name} ditekan lama');
              },

              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    categories[index].name == "Mobile JKN" ? 
                      StoreRedirect.redirect(
                      androidAppId: "app.bpjs.mobile",
                      iOSAppId: "1237601115",
                    ):
                    Navigator.pushNamed(context, categories[index].categoryPage);
                    print('Tombol ${categories[index].name} ditekan melalui InkWell');
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: categories[index].iconPath.endsWith('.svg')
                                ? SvgPicture.asset(
                                    categories[index].iconPath,
                                  )
                                : Image.asset(
                                    categories[index].iconPath,
                                  ),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}


// Metode untuk membangun SearchBar
Container _searchBar() {
  return Container(
        margin: EdgeInsets.only(top:30, left:20, right:20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color : Color(0xff1D1617).withOpacity(0.11),
              blurRadius : 40,
              spreadRadius: 0.0, 
            )
          ]
        ),

        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Doctor Or Location',
            hintStyle: TextStyle(
              color: Color(0xFFDDDADA),
            ),

            prefixIcon: Padding( 
              padding: const EdgeInsets.all(12),
              child : SvgPicture.asset('assets/icons/search-svgrepo-com.svg'),
              ),

            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/filter-1-svgrepo-com.svg'),
                    )  
                  ],
                
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
            )
          ),
        ),
      );
}

// Metode untuk membangun AppBar
AppBar buildAppBar() {
  return AppBar(
    title: Text(
      "Belajar Flutter",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,

    // Tombol menu di bagian actions
    actions: [
      GestureDetector(
        onTap: () {
          // Aksi ketika tombol menu ditekan
          print("Tombol Menu ditekan");
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/dots-horizontal-svgrepo-com.svg',
            height: 20,
            width: 20,
          ),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}

}