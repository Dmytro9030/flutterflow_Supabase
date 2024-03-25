import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'extinguisher_detail_shop_widget.dart' show ExtinguisherDetailShopWidget;
import 'package:flutter/material.dart';

class ExtinguisherDetailShopModel
    extends FlutterFlowModel<ExtinguisherDetailShopWidget> {
  ///  Local state fields for this component.

  List<String> deficiencyList = [];
  void addToDeficiencyList(String item) => deficiencyList.add(item);
  void removeFromDeficiencyList(String item) => deficiencyList.remove(item);
  void removeAtIndexFromDeficiencyList(int index) =>
      deficiencyList.removeAt(index);
  void insertAtIndexInDeficiencyList(int index, String item) =>
      deficiencyList.insert(index, item);
  void updateDeficiencyListAtIndex(int index, Function(String) updateFn) =>
      deficiencyList[index] = updateFn(deficiencyList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for mfgDate widget.
  FocusNode? mfgDateFocusNode;
  TextEditingController? mfgDateController;
  String? Function(BuildContext, String?)? mfgDateControllerValidator;
  String? _mfgDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter a valid manufactured year';
    }

    if (!RegExp('(19[8-9][1-9]|[2-3][0-9]{3})').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Item1 widget.
  FocusNode? item1FocusNode;
  TextEditingController? item1Controller;
  String? Function(BuildContext, String?)? item1ControllerValidator;
  // State field(s) for Item2 widget.
  FocusNode? item2FocusNode;
  TextEditingController? item2Controller;
  String? Function(BuildContext, String?)? item2ControllerValidator;
  // State field(s) for Item3 widget.
  FocusNode? item3FocusNode;
  TextEditingController? item3Controller;
  String? Function(BuildContext, String?)? item3ControllerValidator;
  // State field(s) for Item4 widget.
  FocusNode? item4FocusNode;
  TextEditingController? item4Controller;
  String? Function(BuildContext, String?)? item4ControllerValidator;
  // State field(s) for Item5 widget.
  FocusNode? item5FocusNode;
  TextEditingController? item5Controller;
  String? Function(BuildContext, String?)? item5ControllerValidator;
  // State field(s) for Item6 widget.
  FocusNode? item6FocusNode;
  TextEditingController? item6Controller;
  String? Function(BuildContext, String?)? item6ControllerValidator;
  // State field(s) for Item7 widget.
  FocusNode? item7FocusNode;
  TextEditingController? item7Controller;
  String? Function(BuildContext, String?)? item7ControllerValidator;
  // State field(s) for Item8 widget.
  FocusNode? item8FocusNode;
  TextEditingController? item8Controller;
  String? Function(BuildContext, String?)? item8ControllerValidator;
  // State field(s) for Item9 widget.
  FocusNode? item9FocusNode;
  TextEditingController? item9Controller;
  String? Function(BuildContext, String?)? item9ControllerValidator;
  // State field(s) for Item10 widget.
  FocusNode? item10FocusNode;
  TextEditingController? item10Controller;
  String? Function(BuildContext, String?)? item10ControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  DateTime? datePicked;
  // State field(s) for InspectionDue widget.
  String? inspectionDueValue;
  FormFieldController<String>? inspectionDueValueController;
  // State field(s) for rechargeDD widget.
  String? rechargeDDValue;
  FormFieldController<String>? rechargeDDValueController;
  // State field(s) for RechargeDue widget.
  String? rechargeDueValue;
  FormFieldController<String>? rechargeDueValueController;
  // State field(s) for hydroDD widget.
  String? hydroDDValue;
  FormFieldController<String>? hydroDDValueController;
  // State field(s) for HydroDue widget.
  String? hydroDueValue;
  FormFieldController<String>? hydroDueValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mfgDateControllerValidator = _mfgDateControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    mfgDateFocusNode?.dispose();
    mfgDateController?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    item1FocusNode?.dispose();
    item1Controller?.dispose();

    item2FocusNode?.dispose();
    item2Controller?.dispose();

    item3FocusNode?.dispose();
    item3Controller?.dispose();

    item4FocusNode?.dispose();
    item4Controller?.dispose();

    item5FocusNode?.dispose();
    item5Controller?.dispose();

    item6FocusNode?.dispose();
    item6Controller?.dispose();

    item7FocusNode?.dispose();
    item7Controller?.dispose();

    item8FocusNode?.dispose();
    item8Controller?.dispose();

    item9FocusNode?.dispose();
    item9Controller?.dispose();

    item10FocusNode?.dispose();
    item10Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
