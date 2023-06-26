import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditFileAdmineModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for book_name widget.
  TextEditingController? bookNameController;
  String? Function(BuildContext, String?)? bookNameControllerValidator;
  // State field(s) for author widget.
  TextEditingController? authorController;
  String? Function(BuildContext, String?)? authorControllerValidator;
  // State field(s) for epartment widget.
  TextEditingController? epartmentController;
  String? Function(BuildContext, String?)? epartmentControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    bookNameController?.dispose();
    authorController?.dispose();
    epartmentController?.dispose();
    descriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
