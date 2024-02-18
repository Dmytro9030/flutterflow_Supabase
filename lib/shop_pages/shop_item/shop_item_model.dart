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
  FocusNode? item1TFFocusNode;
  TextEditingController? item1TFController;
  String? Function(BuildContext, String?)? item1TFControllerValidator;
  // State field(s) for item2TF widget.
  FocusNode? item2TFFocusNode;
  TextEditingController? item2TFController;
  String? Function(BuildContext, String?)? item2TFControllerValidator;
  // State field(s) for item3TF widget.
  FocusNode? item3TFFocusNode;
  TextEditingController? item3TFController;
  String? Function(BuildContext, String?)? item3TFControllerValidator;
  // State field(s) for item4TF widget.
  FocusNode? item4TFFocusNode;
  TextEditingController? item4TFController;
  String? Function(BuildContext, String?)? item4TFControllerValidator;
  // State field(s) for item5TF widget.
  FocusNode? item5TFFocusNode;
  TextEditingController? item5TFController;
  String? Function(BuildContext, String?)? item5TFControllerValidator;
  // State field(s) for item6TF widget.
  FocusNode? item6TFFocusNode;
  TextEditingController? item6TFController;
  String? Function(BuildContext, String?)? item6TFControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    item1TFFocusNode?.dispose();
    item1TFController?.dispose();

    item2TFFocusNode?.dispose();
    item2TFController?.dispose();

    item3TFFocusNode?.dispose();
    item3TFController?.dispose();

    item4TFFocusNode?.dispose();
    item4TFController?.dispose();

    item5TFFocusNode?.dispose();
    item5TFController?.dispose();

    item6TFFocusNode?.dispose();
    item6TFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
