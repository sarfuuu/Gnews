import 'package:check/blocs/news_bloc.dart';
import 'package:check/ui/bookmark.dart';
import 'package:check/ui/headlines.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  TextEditingController searchController = TextEditingController();
  bool showSearch = false;

  final _pageOptions = [
    const Headlines(),
    const Bookmark(),
  ];

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllNews(searchController.text);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedPage == 0 ? 'Headlines' : 'Bookmark'),
          actions: [
            showSearch == false
                ? IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        showSearch = true;
                      });
                    })
                : Container(),
            showSearch == true
                ? Container(
                    padding:
                        EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {},
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xFFbdc6cf)),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    showSearch = false;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              bloc.fetchAllNews(searchController.text);
                            },
                            child: Text('search'))
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Tab1'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Tab2'),
            ),
          ],
        ),
        body: _pageOptions[selectedPage]);
  }
}
