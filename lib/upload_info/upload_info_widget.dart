import 'dart:developer';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_info_model.dart';
export 'upload_info_model.dart';

class UploadInfoWidget extends StatefulWidget {
  const UploadInfoWidget({Key? key}) : super(key: key);

  @override
  _UploadInfoWidgetState createState() => _UploadInfoWidgetState();
}

class _UploadInfoWidgetState extends State<UploadInfoWidget> {
  late UploadInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadInfoModel());

    _model.bookNameController ??= TextEditingController();
    _model.authorController ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('upload confirm'),
                                  content: Text(
                                      'You did not complete the upload Do you want to upload the file?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Upload'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                                false;
                            if (!confirmDialogResponse) {
                              context.pushNamed('Upload');
                            }
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mhy4ce43' /* Name */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            fontSize: 25.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: TextFormField(
                          controller: _model.bookNameController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                          textAlign: TextAlign.start,
                          maxLines: null,
                          validator: _model.bookNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '9myhuerv' /* Author */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Tajawal',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: TextFormField(
                          controller: _model.authorController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                          textAlign: TextAlign.start,
                          validator: _model.authorControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '40on4eqg' /* Department */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Tajawal',
                            fontSize: 25.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<List<DepramentRecord>>(
                      stream: queryDepramentRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<DepramentRecord> dropDownDepramentRecordList =
                        snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: dropDownDepramentRecordList
                              .map((e) => valueOrDefault<String>(
                            e.departmentName,
                            'd',
                          ))
                              .toList()
                              .toList(),
                          onChanged: (val){
                            for(int i = 0 ; i < dropDownDepramentRecordList.length ; i++){
                              if(dropDownDepramentRecordList[i].departmentName == val){
                                setState(() => _model.dropDownValue = dropDownDepramentRecordList[i].reference.id);
                                log("feeas: $val");
                                log("feeas: ${_model.dropDownValue}");
                              }
                            }
                          },
                          width: 350.0,
                          height: 50.0,
                          searchHintTextStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyLargeFamily,
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyLargeFamily),
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                          hintText: FFLocalizations.of(context).getText(
                            'serxxduy' /* Please select... */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'sktz13rt' /* Search for an item... */,
                          ),
                          fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'uq69ks73' /* Description */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Tajawal',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: TextFormField(
                          controller: _model.descriptionController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyMediumFamily,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          minLines: 2,
                          keyboardType: TextInputType.multiline,
                          validator: _model.descriptionControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final selectedFile = await selectFile();
                          if (selectedFile != null) {
                            setState(() => _model.isDataUploading = true);
                            FFUploadedFile? selectedUploadedFile;
                            String? downloadUrl;
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFile = FFUploadedFile(
                                name: selectedFile.storagePath.split('/').last,
                                bytes: selectedFile.bytes,
                              );
                              downloadUrl = await uploadData(
                                  selectedFile.storagePath, selectedFile.bytes);
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFile != null &&
                                downloadUrl != null) {
                              setState(() {
                                _model.uploadedLocalFile =
                                selectedUploadedFile!;
                                _model.uploadedFileUrl = downloadUrl!;
                              });
                              showUploadMessage(
                                context,
                                'Success!',
                              );
                            } else {
                              setState(() {});
                              showUploadMessage(
                                context,
                                'Failed to upload file',
                              );
                              return;
                            }
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'yvtkr5nj' /* Upload File */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .titleSmallFamily),
                          ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: // Generated code for this Container Widget...
                      StreamBuilder<List<DepramentRecord>>(
                        stream: queryDepramentRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<DepramentRecord> containerDepramentRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerDepramentRecord = containerDepramentRecordList.isNotEmpty
                              ? containerDepramentRecordList.first
                              : null;
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final dataCreateData = createDataRecordData(
                                author: _model.authorController.text,
                                created: getCurrentTimestamp,
                                description: _model.descriptionController.text,
                                bookstatus: 'pending',
                                booktitle: _model.bookNameController.text,
                                bookpath: _model.uploadedFileUrl,
                                department: containerDepramentRecord!.reference,
                              );
                              await DataRecord.collection.doc().set(dataCreateData);
                              context.pushNamed('HomePage_Admin');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Waiting for confirmation from one of the reviewers.',
                                    style: GoogleFonts.getFont(
                                      'Tajawal',
                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context).accent1,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Thank you for your valuable contribution! The file has been successfully uploaded.',
                                    style: GoogleFonts.getFont(
                                      'Tajawal',
                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFF1F2023),
                                ),
                              );
                            },
                            child: Container(
                              width: 130,
                              height: 40,
                              decoration:  BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [Color(0xFF00FE0D),Color(0xFF00D1FD) ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  //transform: GradientRotation(60),
                                ),
                              ),

                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child:
                                Text('Upload',
                                    style:TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontFamily:'Tajawal'
                                    )
                                ),

                              ),
                            ),
                          );
                        },
                      )
                      ,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
