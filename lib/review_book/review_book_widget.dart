import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'review_book_model.dart';
export 'review_book_model.dart';

class ReviewBookWidget extends StatefulWidget {
  const ReviewBookWidget({
    Key? key,
    this.bookdetail,
  }) : super(key: key);

  final DocumentReference? bookdetail;

  @override
  _ReviewBookWidgetState createState() => _ReviewBookWidgetState();
}

class _ReviewBookWidgetState extends State<ReviewBookWidget> {
  late ReviewBookModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewBookModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<DataRecord>(
            stream: DataRecord.getDocument(widget.bookdetail!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final stackDataRecord = snapshot.data!;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.02, -0.94),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            stackDataRecord.bookcover!,
                            width: 150,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.91, -0.97),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          await FavoriteRecord.collection
                              .doc()
                              .set(createFavoriteRecordData(
                            createdBy: currentUserReference,
                            item: widget.bookdetail,
                          ));
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFF232323),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF1F2023),
                              offset: Offset(2, 0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await actions.downloadFile(
                                      stackDataRecord.bookpath!,
                                      stackDataRecord.booktitle!,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'download suc',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'vq8cyc6a' /* Download */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: Color(0xFF34AC18),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleSmallFamily),
                                    ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await actions.openFile(
                                      stackDataRecord.bookpath!,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '20kncooi' /* Read */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleSmallFamily),
                                    ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.67),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 24, 0, 90),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'of2y6r2m' /* Title */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 8, 0),
                                                    child: Text(
                                                      stackDataRecord.booktitle!,
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'yorku5r6' /* Author */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 0, 0),
                                                    child: Text(
                                                      stackDataRecord.author!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        '6ilanj5c' /* Publication Data */,
                                                      ),
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        stackDataRecord
                                                            .publicationData
                                                            ?.toString(),
                                                        'Date',
                                                      ),
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'qrix5v6z' /* Pages */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 8, 0),
                                                    child: Text(
                                                      stackDataRecord.pages
                                                          .toString(),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        '1twynyw0' /* Publisher */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 8, 0),
                                                    child: Text(
                                                      stackDataRecord.publisher!,
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'lmi25g1n' /* Volume */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 8, 0),
                                                    child: Text(
                                                      stackDataRecord.volume
                                                          .toString(),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 16, 0, 24),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'q3r5scig' /* Department */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 8, 0),
                                                    child: Text(
                                                      stackDataRecord
                                                          .department!,
                                                      textAlign:
                                                      TextAlign.start,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
