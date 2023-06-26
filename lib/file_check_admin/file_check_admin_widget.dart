import 'dart:developer';

import 'package:flutter/scheduler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:scaffale_admin/custom_code/actions/GetToken.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'file_check_admin_model.dart';
export 'file_check_admin_model.dart';

class FileCheckAdminWidget extends StatefulWidget {
  const FileCheckAdminWidget({
    Key? key,
    this.bookcheck,
  }) : super(key: key);

  final DocumentReference? bookcheck;

  @override
  _FileCheckAdminWidgetState createState() => _FileCheckAdminWidgetState();
}

class _FileCheckAdminWidgetState extends State<FileCheckAdminWidget> {
  late FileCheckAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileCheckAdminModel());


  }


  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void sendPushMessage(String title, String body, List<String> token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAXHB3vYo:APA91bF8ouxAR9CmzcOesl7x-GgisD6btKhmiI32IKwr9XAd6jewlXzvWuJgUf_qcrvRJn1ugR77xJnuJlgHbFWAU3undwIFx-NK3l2vkUpZLqYx4i7MErUg7gAYMNRfwm0kodrFhnjS',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'title': title,
              'body': body,
            },
            "registration_ids": token,
          },
        ),
      ).then((value) => log('70da: ${value.statusCode}'));
      log('70da: Done');
    } catch (e) {
      log("70da: Error push notification");
    }
  }


  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    String? depName = "";


    return StreamBuilder<List<DepramentRecord>>(
        stream: queryDepramentRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          List<DepramentRecord> fileCheckAdminDepramentRecordList =
          snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final fileCheckAdminDepramentRecord =
          fileCheckAdminDepramentRecordList.isNotEmpty
              ? fileCheckAdminDepramentRecordList.first
              : null;




          return GestureDetector(
            onTap: () =>
                FocusScope.of(context).requestFocus(_model.unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme
                  .of(context)
                  .primaryBackground,
              body: SafeArea(
                top: true,
                child: StreamBuilder<DataRecord>(
                  stream: DataRecord.getDocument(widget.bookcheck!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme
                                .of(context)
                                .primary,
                          ),
                        ),
                      );
                    }
                    final containerDataRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme
                            .of(context)
                            .secondaryBackground,
                      ),
                      child: StreamBuilder<DataRecord>(
                        stream: DataRecord.getDocument(widget.bookcheck!),
                        builder: (context, snapshot) {
                          DocumentReference? ref = containerDataRecord.department as DocumentReference?;
                          if (ref != null) {
                            String refId = ref.id; // Access the document ID or other relevant property
                            log('feras: $refId');

                            for (int i = 0; i < fileCheckAdminDepramentRecordList.length; i++) {
                              if (fileCheckAdminDepramentRecordList[i].reference == ref) {
                                depName = fileCheckAdminDepramentRecordList[i].departmentName;
                                log('feras $depName');
                              }
                            }
                          }

                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .primary,
                                ),
                              ),
                            );
                          }
                          final stackDataRecord = snapshot.data!;
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 24, 0, 24),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            containerDataRecord.bookcover,
                                            'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                          ),
                                          width: 170,
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('review');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ng24mwf4' /* Read */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 0, 0, 0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                            color: Color(0xFF212225),
                                            textStyle: FlutterFlowTheme
                                                .of(context)
                                                .titleSmall
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme
                                                      .of(context)
                                                      .titleSmallFamily),
                                            ),
                                            elevation: 2,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                10),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        '38t12tp1' /* Description */,
                                                      ),
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 0, 0),
                                                    child: Text(
                                                      containerDataRecord
                                                          .description!,
                                                      textAlign: TextAlign
                                                          .justify,
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'xs800y5x' /* Department */,
                                                      ),
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                // Generated code for this Text Widget...
                                                // Generated code for this Text Widget...
                                                // Generated code for this Text Widget...
                                                Align(
                                                  alignment: AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        depName,
                                                        'de',
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                    ),
                                                  ),
                                                )


                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'uigsv0w0' /* Author */,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 0, 0),
                                                    child: Text(
                                                      containerDataRecord
                                                          .author!,
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        't36p8jmd' /* Title */,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 0),
                                                    child: Text(
                                                      containerDataRecord
                                                          .booktitle!,
                                                      textAlign: TextAlign
                                                          .start,
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().approvedreject == false)
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .primaryText,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().approvedreject =
                                              true;
                                            });
                                          },
                                          child: Container(
                                            width: 130,
                                            height: 40,

                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0, 0),
                                              child: Text(
                                                 FFLocalizations.of(context)
                                                      .getText(
                                                    'q165fa8h' /* Next */,
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      fontFamily: 'Tajawal'
                                                  )
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius
                                                  .circular(50),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF00FE0D),
                                                  Color(0xFF00D1FD)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                //transform: GradientRotation(60),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Edit_file_Admine',
                                              queryParams: {
                                                'bookinfo': serializeParam(
                                                  widget.bookcheck,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 130,
                                            height: 40,

                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0, 0),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vp8ur5os' /* Edit */,
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      fontFamily: 'Tajawal'
                                                  )
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .secondaryBackground,
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (FFAppState().approvedreject == true)
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .primaryText,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final dataUpdateData =
                                            createDataRecordData(
                                              bookstatus: 'approved',
                                            );
                                            GetTokens().then((value) => sendPushMessage("New Book Arrive", containerDataRecord.booktitle!, value));

                                            await widget.bookcheck!
                                                .update(dataUpdateData);

                                            context.pushNamed('HomePage_Admin');
                                          },
                                          child: Container(
                                            width: 130,
                                            height: 40,

                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0, 0),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2xm14d6s' /* Approved */,
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      fontFamily: 'Tajawal'
                                                  )
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius
                                                  .circular(50),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF00FE0D),
                                                  Color(0xFF00D1FD)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                //transform: GradientRotation(60),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await widget.bookcheck!.delete();

                                            context.pushNamed('HomePage_Admin');
                                          },
                                          child: Container(
                                            width: 130,
                                            height: 40,

                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0, 0),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tyux7afu' /* Reject */,
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      fontFamily: 'Tajawal'
                                                  )
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .secondaryBackground,
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}
