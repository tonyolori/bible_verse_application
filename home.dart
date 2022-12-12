import 'package:flutter/material.dart';
import 'bible_page.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'bible_source.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  BibleBrain bible = BibleBrain();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GredientButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (BiblePage(
                        bible: bible,
                      ))),
            );
            //await bible.getRandomBookk();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => (BiblePage(
            //             bible: bible,
            //           ))),
            // );
          },
          splashColor: Color.fromARGB(255, 245, 11, 140),
          colors: const [
            Color(0XFF900c3f),
            Color.fromARGB(255, 245, 11, 140),
          ],
          title: "Random bible verse!",
        ),
      ),
    );
  }
}
