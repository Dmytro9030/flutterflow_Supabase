import '/flutter_flow/flutter_flow_util.dart';
import 'shop_item_widget.dart' show ShopItemWidget;
import 'package:flutter/material.dart';

class ShopItemModel extends FlutterFlowModel<ShopItemWidget> {
  ///  Local state fields for this component.

  List<String> itemList = [];
  void addToItemList(String item) => itemList.add(item);
  void removeFromItemList(String item) => itemList.remove(item);
  void removeAtIndexFromItemList(int index) => itemList.removeAt(index);
  void insertAtIndexInItemList(int index, String item) =>
      itemList.insert(index, item);
  void updateItemListAtIndex(int index, Function(String) updateFn) =>
      itemList[index] = updateFn(itemList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for item1TF widget.
  FocusNode? item1TFFocusNode1;
  TextEditingController? item1TFController1;
  String? Function(BuildContext, String?)? item1TFController1Validator;
  // State field(s) for item2TF widget.
  FocusNode? item2TFFocusNode1;
  TextEditingController? item2TFController1;
  String? Function(BuildContext, String?)? item2TFController1Validator;
  // State field(s) for item3TF widget.
  FocusNode? item3TFFocusNode1;
  TextEditingController? item3TFController1;
  String? Function(BuildContext, String?)? item3TFController1Validator;
  // State field(s) for item4TF widget.
  FocusNode? item4TFFocusNode1;
  TextEditingController? item4TFController1;
  String? Function(BuildContext, String?)? item4TFController1Validator;
  // State field(s) for item5TF widget.
  FocusNode? item5TFFocusNode1;
  TextEditingController? item5TFController1;
  String? Function(BuildContext, String?)? item5TFController1Validator;
  // State field(s) for item6TF widget.
  FocusNode? item6TFFocusNode1;
  TextEditingController? item6TFController1;
  String? Function(BuildContext, String?)? item6TFController1Validator;
  // State field(s) for item1TF widget.
  FocusNode? item1TFFocusNode2;
  TextEditingController? item1TFController2;
  String? Function(BuildContext, String?)? item1TFController2Validator;
  // State field(s) for item2TF widget.
  FocusNode? item2TFFocusNode2;
  TextEditingController? item2TFController2;
  String? Function(BuildContext, String?)? item2TFController2Validator;
  // State field(s) for item3TF widget.
  FocusNode? item3TFFocusNode2;
  TextEditingController? item3TFController2;
  String? Function(BuildContext, String?)? item3TFController2Validator;
  // State field(s) for item4TF widget.
  FocusNode? item4TFFocusNode2;
  TextEditingController? item4TFController2;
  String? Function(BuildContext, String?)? item4TFController2Validator;
  // State field(s) for item5TF widget.
  FocusNode? item5TFFocusNode2;
  TextEditingController? item5TFController2;
  String? Function(BuildContext, String?)? item5TFController2Validator;
  // State field(s) for item6TF widget.
  FocusNode? item6TFFocusNode2;
  TextEditingController? item6TFController2;
  String? Function(BuildContext, String?)? item6TFController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    item1TFFocusNode1?.dispose();
    item1TFController1?.dispose();

    item2TFFocusNode1?.dispose();
    item2TFController1?.dispose();

    item3TFFocusNode1?.dispose();
    item3TFController1?.dispose();

    item4TFFocusNode1?.dispose();
    item4TFController1?.dispose();

    item5TFFocusNode1?.dispose();
    item5TFController1?.dispose();

    item6TFFocusNode1?.dispose();
    item6TFController1?.dispose();

    item1TFFocusNode2?.dispose();
    item1TFController2?.dispose();

    item2TFFocusNode2?.dispose();
    item2TFController2?.dispose();

    item3TFFocusNode2?.dispose();
    item3TFController2?.dispose();

    item4TFFocusNode2?.dispose();
    item4TFController2?.dispose();

    item5TFFocusNode2?.dispose();
    item5TFController2?.dispose();

    item6TFFocusNode2?.dispose();
    item6TFController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
