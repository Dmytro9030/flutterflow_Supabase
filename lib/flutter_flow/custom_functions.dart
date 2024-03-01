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

int geteqptWoLisIDFunction(
  List<EqptWoLisRow> eqptRow,
  int eqptID,
) {
  int result = -1;
  eqptRow.asMap().forEach(
    (idx, value) {
      if (value.eqpt == eqptID) {
        result = value.id;
      }
    },
  );
  return result;
}

bool subContainingFunc(
  String mainString,
  String subString,
) {
  if (mainString.contains(subString)) {
    return true;
  }
  return false;
}

String? geteqpWoListStateFunction(
  List<EqptWoLisRow> eqptRow,
  int eqptID,
) {
  String? result;
  eqptRow.asMap().forEach(
    (idx, value) {
      if (value.eqpt == eqptID) {
        result = value.status;
      }
    },
  );
  return result;
}

int getIndexOfCustomerFunc(
  List<CustomersRow> customerList,
  int id,
) {
  var result = 0;
  customerList.asMap().forEach((index, value) {
    if (value.id == id) {
      result = index;
    }
  });
  return result;
}
