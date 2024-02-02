import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

String formatDate(DateTime date) {
  if (date == null) {
    return '';
  }
  return DateFormat('MM/dd/yyyy').format(date);
}

bool existIDCheckFunc(dynamic response) {
  if (response.toString() == "[]") {
    return false;
  } else
    return true;
}

List<int> getEqptIDFunction(List<EqptWoLisRow> eqptRow) {
  List<int> result = [];
  eqptRow.asMap().forEach(
    (idx, value) {
      result.add(value.eqpt!.toInt());
    },
  );
  return result;
}

int getIDFunction(
  List<EqptWoLisRow> eqptRow,
  int eqptID,
) {
  int result = -1;
  eqptRow.asMap().forEach(
    (idx, value) {
      if (value.eqpt == eqptID) {
        result = idx;
      }
    },
  );
  return result;
}

bool containingFunction(
  String mainString,
  String subString,
) {
  if (mainString.contains(subString)) {
    return true;
  }
  return false;
}