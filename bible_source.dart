// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:bible/bible.dart' as Bible;
import 'dart:math';

import 'package:flutter/cupertino.dart';

class BibleBrain {
  late var passage;
  String text = 'placeholder';
  String bookName = 'placeholder';
  late var verses;
  late List<String> verseList;
  late int _verseIndex;
  late int bookNumber;

  getPassage(String query) async {
    Bible.addKeys({'esvapi': 'APITOKEN'});
    var passage =
        await Bible.queryPassage(query); // Will default to the GetBible API
    // print(passage?.passage);
  }

  /// This function updates the verse variable with a book
  _getBook(String query) async {
    Bible.addKeys({'esvapi': 'APITOKEN'});
    passage =
        await Bible.queryPassage(query); // Will default to the GetBible API

    verses = passage?.verses;
    verseList = passage?.verses?.keys.toList() ?? [];
  }

  ///after a book has been chosen this function gets a random verse from that book
  getRandomVerseStaticBook() {
    _verseIndex = Random().nextInt(verseList.length);
    bookName = verseList[_verseIndex];
    text = verses[bookName];
    return text;
  }

  nextVerse() {
    if ((_verseIndex + 1) < verseList.length) {
      _verseIndex = _verseIndex + 1;
    } else {
      _nextBook();
    }
    bookName = verseList[_verseIndex];
    text = verses[bookName];
  }

  previousVerse() {
    if (_verseIndex > 0) {
      _verseIndex = _verseIndex - 1;
    } else {
      _nextBook();
    }
    bookName = verseList[_verseIndex];
    text = verses[bookName];
  }

  _nextBook() async {
    if (bookNumber + 1 >= books.length) {
      return;
    }
    bookNumber = bookNumber + 1;
    _verseIndex = 0;
    await _getBook(books.values.toList()[bookNumber]);
  }

  getRandomBook() async {
    bookNumber = Random().nextInt(books.length);

    //await getPassage('john 3:16');
    //text = passage.passage;
    await _getBook(books.values.toList()[bookNumber]);
    getRandomVerseStaticBook();
    //setstate(() {});
  }

  // getRandomBookk() async {
  //   bookNumber = Random().nextInt(books.length);

  //   //await getPassage('john 3:16');
  //   //text = passage.passage;
  //   await _getBook(books.values.toList()[bookNumber]);
  //   getRandomVerseStaticBook();
  // }

  BibleBrain() {
    // getstuff();
  }
}

const Map<int, String> books = {
  1: "Genesis",
  2: "Exodus",
  3: "Leviticus",
  4: "Numbers",
  5: "Deuteronomy",
  6: "Joshua",
  7: "Judges",
  8: "Ruth",
  9: "1 Samuel",
  10: "2 Samuel",
  11: "1 Kings",
  12: "2 Kings",
  13: "1 Chronicles",
  14: "2 Chronicles",
  15: "Ezra",
  16: "Nehemiah",
  17: "Esther",
  18: "Job",
  19: "Psalms",
  20: "Proverbs",
  21: "Ecclesiastes",
  22: "Song of Solomon",
  23: "Isaiah",
  24: "Jeremiah",
  25: "Lamentations",
  26: "Ezekiel",
  27: "Daniel",
  28: "Hosea",
  29: "Joel",
  30: "Amos",
  31: "Obadiah",
  32: "Jonah",
  33: "Micah",
  34: "Nahum",
  35: "Habakkuk",
  36: "Zephaniah",
  37: "Haggai",
  38: "Zechariah",
  39: "Malachi",
  40: "Matthew",
  41: "Mark",
  42: "Luke",
  43: "John",
  44: "Acts",
  45: "Romans",
  46: "1 Corinthians",
  47: "2 Corinthians",
  48: "Galatians",
  49: "Ephesians",
  50: "Philippians",
  51: "Colossians",
  52: "1 Thessalonians",
  53: "2 Thessalonians",
  54: "1 Timothy",
  55: "2 Timothy",
  56: "Titus",
  57: "Philemon",
  58: "Hebrews",
  59: "James",
  60: "1 Peter",
  61: "2 Peter",
  62: "1 John",
  63: "2 John",
  64: "3 John",
  65: "Jude",
  66: "Revelation",
};
