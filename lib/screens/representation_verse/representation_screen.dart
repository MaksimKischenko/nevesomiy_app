import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nevesomiy_app/res/data_repository.dart';
import 'package:nevesomiy_app/res/string_format_res.dart';
import 'package:nevesomiy_app/screens/screens.dart';
import 'package:nevesomiy_app/styles.dart';

import 'widgets/widgets.dart';



class RepresentationScreen extends StatefulWidget {
  const RepresentationScreen({ Key? key }) : super(key: key);

  @override
  State<RepresentationScreen> createState() => RepresentationScreenState();
}

class RepresentationScreenState extends State<RepresentationScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // To Close Drawer 

  String verseHeader = ''; 
  String? verse = '';
  String? selectedVerseTheme; 
  bool isSearchPressed = false;
  TextEditingController searchTextController = TextEditingController();
  int selectedBottomNavigationIndex = 0;
  int currentPageValue = 0;

  @override
  void dispose() {
    searchTextController.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if(DataRepository.selectedThemes.isNotEmpty) {
      selectedVerseTheme = DataRepository.selectedThemes.elementAt(0);
    }

    if(themesVersesExample.keys.contains(selectedVerseTheme)) {
      verse = verses.values.firstWhere((element) => element.contains(themesVersesExample[selectedVerseTheme] ?? ''));
      verseHeader = versesHeaderKey[selectedVerseTheme] ?? '';
    } else {
      verse = verses.values.first;
      verseHeader = verses.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppStyle.appBarColor,
        actions: [
              IconButton(
              onPressed: () {
                setState(() {
                  isSearchPressed = !isSearchPressed; 
                  if(!isSearchPressed) {
                    searchTextController.clear();
                  }
                });
              },
              icon: const Icon(Icons.search),
              color: AppStyle.spaceColor,
            ),
        ],
        centerTitle: true,
        title: FittedBox(child: Text('$verseHeader...', style: AppStyle.headerTextStyle)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius. circular(38),
                    child: Image.asset('assets/images/foto.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover
                    )
                  ),
                  const SizedBox(height: 10),
                  Text('Максим Невесомый', style: AppStyle.selectedThemes)
                ],
              ),
              decoration: BoxDecoration(
                color: AppStyle.appBarColor,
              ),
            ),
            ...verses.keys.map((e) => Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                child: Text(e, style: AppStyle.representationDrawerVerseTextStyle),
                onPressed: () {
                  setState(() {
                    verse = verses[e] ?? '';
                    verseHeader = e;
                    toggleDrawer();
                  });
                },
              ),
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          isSearchPressed?  Padding(
            padding: const EdgeInsets.all(10),
            child:  SearchTextField(
              controller: searchTextController,
              onTap: (value) {
                setState(() {
                  verseHeader = (verses.keys.contains(value.toUpperCase())? value.toUpperCase() : ''  );
                  verse = verses[value.toUpperCase()] ?? 'Не найдено';     
                  searchTextController.clear();
                  isSearchPressed = false;            
                });

              },
            ),
          ) : Container(),
          Expanded(
            child: AbsorbPointer(
              absorbing: searchTextController.text.isNotEmpty,
              child: CarouselSlider.builder(
                itemCount: verses.length,
                itemBuilder: (context, index, realIndex) {          
                  return Container(
                    color: AppStyle.spaceColor,
                    child:  Center(
                      child: Opacity(
                        opacity: index == currentPageValue ? 1.0: 0.5,
                        child: Transform.scale(
                          scale: index == currentPageValue? 1.0: 0.9,
                          child: VerseCard(verse: verse ?? 'Не найдено')
                        )
                      )
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    currentPageValue = index;
                    setState(() {
                      if(searchTextController.text.isEmpty) {
                        verseHeader = verses.keys.elementAt(index);
                        verse = verses.values.elementAt(index);
                      } else {
                        //searchTextController.clear();                     
                      }
                    });
                  },
                  viewportFraction: 0.8,
                  height: MediaQuery.of(context).size.height
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}