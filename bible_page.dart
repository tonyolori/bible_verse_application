import 'package:random_bible_verse_app/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'bible_source.dart';
import 'package:flutter/material.dart';
import 'loading_page.dart';

class BiblePage extends StatefulWidget {
  final BibleBrain bible;
  const BiblePage({Key? key, required this.bible}) : super(key: key);

  @override
  State<BiblePage> createState() => _BiblePageState(bible);
}

class _BiblePageState extends State<BiblePage> {
  late var passage;
  late String text;
  late Map<String, String> verses;
  final BibleBrain bible;
  bool isLoading = false;
  bool favourite = false;

  _BiblePageState(this.bible);

  @override
  void initState() {
    super.initState();
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });

    getRandomBooksetstate();
  }

  getRandomBooksetstate() async {
    setState(() {
      isLoading = true;
    });
    await bible.getRandomBook();
    setState(() {
      isLoading = false;
    });
  }

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 200),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kActiveCardColour,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isLoading
                              ? const Text("")
                              : Text(
                                  //overflow: TextOverflow.clip,
                                  "${bible.bookName}: ${bible.text}",
                                  style: ktextstyle,
                                ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  favourite = !favourite;
                                  setState(() {});
                                },
                                child: favourite
                                    ? kfavoriteRounded
                                    : kFavouriteOutlined,
                              ))
                        ],
                      )),
                ),
              ),
            ),
            isLoading
                ? Column(
                    children: const [
                      Text('Loading...'),
                      SizedBox(
                        height: 8,
                      ),
                      CircularProgressIndicator(
                        // value: controller.value,
                        // semanticsLabel: 'Circular progress indicator',
                        color: Colors.white,
                      ),
                    ],
                  )
                : Container(),

            // LoadingAnimationWidget.threeArchedCircle(
            //   color: Colors.white,
            //   size: 50,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRectangleButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await bible.previousVerse();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 64,
                  ),
                ),
                CustomRectangleButton(
                  onPressed: () {
                    // bible.text = "";
                    // bible.bookName = '';
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 64,
                  ),
                ),
                CustomRectangleButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await bible.nextVerse();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 64,
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

class CustomRectangleButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;

  const CustomRectangleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(10),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: kActiveCardColour,
      height: 80,
      minWidth: 80,
      child: icon,
    );
  }
}
