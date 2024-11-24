import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'hive_utils.dart';
import 'dart:io';





///!  --------- Injections --------
final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
final Directory directory = GetIt.I.get<Directory>();
final HiveUtils hiveUtils = GetIt.I.get<HiveUtils>();
final FirebaseFirestore firestore = GetIt.I.get<FirebaseFirestore>();



///!  ------------------ References ------------------


///!  ------------------ Logics ------------------



///!  ------------------ Utils ------------------
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
final DateFormat dateFormat = DateFormat("yyyy MMM dd");
final DateFormat timeFormat = DateFormat('E, h:mm a');
final kToday = DateTime.now();
final Logger logger = Logger();





///!  ------------------ Declare ------------------



///!  --------- Static ---------
const List<String> videoFormats = [
  '.mp4',
  '.mov',
  '.avi',
  '.wmv',
  '.3gp',
  '.3gpp',
  '.mkv',
  '.flv',
];

const List<String> imageFormats = [
  '.jpeg',
  '.png',
  '.jpg',
  '.gif',
  '.webp',
  '.tif',
  '.heic',
];

const List<String> pdfFormats = ['.pdf'];