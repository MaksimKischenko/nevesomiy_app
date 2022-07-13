import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nevesomiy_app/res/data_repository.dart';
import 'package:nevesomiy_app/res/string_format_res.dart';
import 'package:nevesomiy_app/screens/screens.dart';
import 'package:nevesomiy_app/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemesScreen extends StatefulWidget {
  
  
  const ThemesScreen({ Key? key }) : super(key: key);

  @override
  State<ThemesScreen> createState() => ThemesScreenState();
}

class ThemesScreenState extends State<ThemesScreen> {

  final String urlInfo = 'https://instagram.com/maksimnevesomiy';
  final String urlSong = 'https://music.yandex.by/album/20242011/track/97894553';
  
  
  String? representationText = '';

  bool showBody = false;
  bool showRepresentationText = false;
  bool showButton = false;
  bool showInfoAbout = false;  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.appBarColor, 
          centerTitle: true,
          title: FittedBox(
            child: Text('Max Nevesomiy. Поэзия', style: AppStyle.headerTextStyle)
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
                title: AnimatedCrossFade(
                  firstChild: Text('Узнать больше об авторе...', style: AppStyle.unselectedThemes),
                  secondChild: Text('Maxim Nevesomiy:', style: AppStyle.representationVerseTextStyle),
                  crossFadeState: !showInfoAbout? CrossFadeState.showFirst: CrossFadeState.showSecond,
                  duration: const Duration(seconds: 2),
                ),
                onTap: () async {
                  setState(() {
                    showInfoAbout = !showInfoAbout;                      
                  });
                },
              ),
              showInfoAbout? Padding(
                padding: const EdgeInsets.all(20),
                child: DefaultTextStyle(
                  style: AppStyle.representationVerseTextStyle,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        aboutInfo,
                        cursor: '',
                        speed: const Duration(milliseconds: 40),
                        curve: Curves.easeOutExpo
                      ),
                    ],
                    onFinished: () {

                    },
                  ),
                ),
              ) : Container(),
              // ListTile(
              //   title: Row(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius. circular(10),
              //         child: Image.asset('assets/images/Instagram.png',
              //           height: 40,
              //           width: 40,
              //           fit: BoxFit.cover
              //         )
              //       ),
              //       const SizedBox(width: 10),
              //       FittedBox(child: Text('Автор в Instagram', style: AppStyle.unselectedThemes)),
              //     ],
              //   ),
              //   onTap: () async {
              //     if(await canLaunch(urlInfo)) {
              //       await launch(urlInfo, forceSafariVC: false);
              //     } else {
              //       throw 'Could not launch $urlInfo';
              //     }
              //   },
              // ),
              ListTile(
                title: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius. circular(10),
                      child: Image.asset('assets/images/music.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover
                      )
                    ),
                    const SizedBox(width: 10),
                    FittedBox(child: Text('Песни на стихи автора', style: AppStyle.unselectedThemes)),
                  ],
                ),
                onTap: () async {
                  if(await canLaunch(urlSong)) {
                    await launch(urlSong, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $urlInfo';
                  }
                },
              ),                                                             
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: AppStyle.representationVerseTextStyle,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(previewTitle),
                    ],
                    onFinished: () {
                      setState(() {
                        showBody = true;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                showBody? Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: themesVerse.map((e) => 
                  ChoiceChip(
                    disabledColor: Colors.transparent,
                    elevation: 20,
                    onSelected: (value) {
                      if(value) {
                        DataRepository.selectedThemes.clear();
                        DataRepository.selectedThemes.add(e);
                        representationText = _showRepresentation(e);
                        showRepresentationText = true;
                        showButton = false;
                      } else {
                        DataRepository.selectedThemes.remove(e);
                        if(DataRepository.selectedThemes.isEmpty) {
                          showRepresentationText = false;
                        }
                      }
                      setState(() {
                        
                      });
                    },
                    label: Text(e, style: DataRepository.selectedThemes.contains(e)? AppStyle.selectedThemes: AppStyle.unselectedThemes),
                    selected: DataRepository.selectedThemes.contains(e),
                    selectedColor: AppStyle.appBarColor,
                    backgroundColor: Colors.transparent,
                  )).toList()
                ) : Container(),
                const SizedBox(height: 20),
                showRepresentationText? DefaultTextStyle(
                  style: AppStyle.representationVerseTextStyle,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText('$representationText'),
                    ],
                    onFinished: () {
                      setState(() {                     
                        showRepresentationText = false;
                        showButton = true;
                      });
                    },
                  ),
                ) : Text('$representationText', style: AppStyle.representationVerseTextStyle),
                const SizedBox(height: 40),
                showButton? 
                Center(
                  child: Center(
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(8),
                      child: CupertinoButton(
                        color:AppStyle.appCardColor,
                        onPressed: () {
                          context.findAncestorStateOfType<MainAppScreenState>()?.setState(() {
                            context.findAncestorStateOfType<MainAppScreenState>()?.selectedBottomNavigationIndex = 1;
                          });

                        }, 
                        child: Text('Читать еще...', style: AppStyle.unselectedThemes)
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
          ),
        ),
    );
  }

  String _showRepresentation(String incomeText) {
    String resultVerse = '';
    for (var element in themesVersesExample.keys) {
      if(element == incomeText) {
        resultVerse = themesVersesExample[element] ?? '';
      }
    }
    return resultVerse;
  }
}