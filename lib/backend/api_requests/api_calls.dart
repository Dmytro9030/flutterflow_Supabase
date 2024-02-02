import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchCompaniesCall {
  static Future<ApiCallResponse> call({
    String? searchString = 'a',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchCompanies',
      apiUrl:
          'https://qlefaywtxbyejnlapehf.supabase.co/rest/v1/customers?or=(name.ilike.%$searchString%)',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? companyResults(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UpdateDatesCall {
  static Future<ApiCallResponse> call({
    int? customerIDValue,
    String? dateToEdit = '',
    String? newDateValue = '',
    String? typeValue = '',
  }) async {
    final ffApiRequestBody = '''
{
  "$dateToEdit": "$newDateValue"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateDates',
      apiUrl:
          'https://qlefaywtxbyejnlapehf.supabase.co/rest/v1/equipment?customer=eq.$customerIDValue&type=eq.$typeValue',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'Prefer': 'return=representation',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FindEquipmentOfTypeCall {
  static Future<ApiCallResponse> call({
    int? custIDValue,
    String? typeListItem = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'findEquipmentOfType',
      apiUrl:
          'https://qlefaywtxbyejnlapehf.supabase.co/rest/v1/equipment?customer=eq.$custIDValue&type=eq.$typeListItem',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FindWorkOrderIDCall {
  static Future<ApiCallResponse> call({
    int? typedID,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'findWorkOrderID',
      apiUrl:
          'https://qlefaywtxbyejnlapehf.supabase.co/rest/v1/eqptWoLis?id=eq.$typedID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FindEqptIDCall {
  static Future<ApiCallResponse> call({
    String? serial = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'findEqptID',
      apiUrl:
          'https://qlefaywtxbyejnlapehf.supabase.co/rest/v1/equipment?serial=eq.$serial',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFsZWZheXd0eGJ5ZWpubGFwZWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0MDcyMzUsImV4cCI6MjAxOTk4MzIzNX0.kSaSQ-_ikrCxp4iDXh7yGf11TpvdmKhttD7-Li3Wsk4',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
