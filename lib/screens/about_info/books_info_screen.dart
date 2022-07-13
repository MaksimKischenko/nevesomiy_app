import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:nevesomiy_app/styles.dart';


class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({ Key? key }) : super(key: key);

  @override
  State<BookInfoScreen> createState() => BookInfoScreenState();
}

class BookInfoScreenState extends State<BookInfoScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late PdfController pdfControllerBook1;
  late PdfController pdfControllerBook2;  
  String urlInfo = 'https://instagram.com/maksimnevesomiy';
  bool firstBookIsLoaded = true;
  bool secondBookIsLoaded = false;

  @override
  void initState() {
    super.initState();
     pdfControllerBook1  = PdfController(
      document: PdfDocument.openAsset('assets/book_1.pdf')
    );
     pdfControllerBook2  = PdfController(
      document: PdfDocument.openAsset('assets/book_2.pdf')
    );
  }

  @override
  void dispose() {
     pdfControllerBook1.dispose();
     pdfControllerBook2.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppStyle.appBarColor, 
        centerTitle: true,
        title: FittedBox(
          child: Text('Max Nevesomiy. Книги', style: AppStyle.headerTextStyle)
        ),                  
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
            ListTile(
              title: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset('assets/images/book_1.png',
                          height: 120,
                          width: 100,
                          fit: BoxFit.cover
                        )
                      ),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: firstBookIsLoaded? 0 : 2.0, sigmaY:firstBookIsLoaded? 0 : 2.0),
                          child: const SizedBox(
                            height: 120,
                            width: 100,
                          ),
                        ),
                      )                      
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: FittedBox(child: Text('На звездных качелях', style: AppStyle.unselectedThemes))),
                ],
              ),
              onTap: () async {
                setState(() {
                  pdfControllerBook1 = PdfController(document: PdfDocument.openAsset('assets/book_1.pdf'));
                  pdfControllerBook2.dispose();
                  firstBookIsLoaded = true;
                  secondBookIsLoaded = false;                 
                });
                toggleDrawer();
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset('assets/images/book_2.png',
                          height: 120,
                          width: 100,
                          fit: BoxFit.cover
                        )
                      ),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: secondBookIsLoaded? 0 : 2.0, sigmaY:secondBookIsLoaded? 0 : 2.0),
                          child: const SizedBox(
                            height: 120,
                            width: 100,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: FittedBox(child: Text('По кольцевой до самых звезд', style: AppStyle.unselectedThemes))),
                ],
              ),
              onTap: () async {
                setState(() {
                  pdfControllerBook2  = PdfController(document: PdfDocument.openAsset('assets/book_2.pdf'));
                  pdfControllerBook1.dispose();
                  firstBookIsLoaded = false;
                  secondBookIsLoaded = true;
                });
                toggleDrawer();
              },
            ),            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            firstBookIsLoaded? Expanded(
              child: PdfView(
                loaderSwitchDuration: const Duration(milliseconds: 500),
                controller: pdfControllerBook1,
                scrollDirection: Axis.horizontal,
                renderer: (PdfPage page) {
                  return page.render(
                    width: page.width * 4, 
                    height: page.height * 4,
                  );
                },
              )
            ) : Container(),
            secondBookIsLoaded? Expanded(
              child: PdfView(
                loaderSwitchDuration: const Duration(milliseconds: 500),
                controller: pdfControllerBook2,
                scrollDirection: Axis.horizontal,
                renderer: (PdfPage page) {
                  return page.render(
                    width: page.width * 4, 
                    height: page.height * 4,
                  );
                },
              )
            ) : Container(),  
          ]
        ),
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