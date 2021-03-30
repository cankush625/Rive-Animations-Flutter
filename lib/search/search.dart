import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final riveFileName = 'assets/search.riv';
  Artboard _artboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('search_animation'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screensize.height * 0.3),
              child: Text(
                'Search App',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w800,
                  color: Colors.orangeAccent[700]
                ),
              ),
            ),
            SizedBox(
              height: screensize.height * 0.07,
            ),
            Padding(
              padding: EdgeInsets.only(left: screensize.width * 0.05),
              child: Container(
                height: 60,
                width: screensize.width * 0.9,
                child: Row(
                  children: [
                    SizedBox(
                      width: screensize.width * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: 30,
                      child: _artboard != null
                          ? Rive(
                        artboard: _artboard,
                        fit: BoxFit.cover,
                      )
                          : Container(),
                    ),
                    SizedBox(
                      width: screensize.width * 0.03,
                    ),
                    Container(
                      height: 50,
                      width: screensize.width * 0.7,
                      child: TextFormField(
                        showCursor: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search now',
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: screensize.height * 0.3,
            ),
            Column(
              children: [
                Text(
                  'Creator',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Ankush Chavan',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}