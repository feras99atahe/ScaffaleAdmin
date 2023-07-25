import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditFileAdminePaperModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
  FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for author widget.
  TextEditingController? authorController;
  String? Function(BuildContext, String?)? authorControllerValidator;
  DateTime? datePicked;
  // State field(s) for journal widget.
  TextEditingController? journalController;
  String? Function(BuildContext, String?)? journalControllerValidator;
  // State field(s) for pages widget.
  TextEditingController? pagesController;
  String? Function(BuildContext, String?)? pagesControllerValidator;
  // State field(s) for publisher widget.
  TextEditingController? publisherController;
  String? Function(BuildContext, String?)? publisherControllerValidator;
  // State field(s) for volume widget.
  TextEditingController? volumeController1;
  String? Function(BuildContext, String?)? volumeController1Validator;
  // State field(s) for volume widget.
  TextEditingController? volumeController2;
  String? Function(BuildContext, String?)? volumeController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    titleController?.dispose();
    authorController?.dispose();
    journalController?.dispose();
    pagesController?.dispose();
    publisherController?.dispose();
    volumeController1?.dispose();
    volumeController2?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
