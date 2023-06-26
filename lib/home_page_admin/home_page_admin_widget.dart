import 'dart:developer';

import '/backend/backend.dart';
import '/components/view_book_info_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'home_page_admin_model.dart';
export 'home_page_admin_model.dart';

class HomePageAdminWidget extends StatefulWidget {
  const HomePageAdminWidget({
    Key? key,
    this.bookcover,
  }) : super(key: key);

  final String? bookcover;

  @override
  _HomePageAdminWidgetState createState() => _HomePageAdminWidgetState();
}

class _HomePageAdminWidgetState extends State<HomePageAdminWidget> {
  late HomePageAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageAdminModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('Upload');
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          elevation: 8.0,
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
              size: 35.0,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF00FE0D),Color(0xFF00D1FD) ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //transform: GradientRotation(60),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: SelectionArea(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kwtzw5aj' /* Upload Request */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context).displaySmall,
                          )),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: StreamBuilder<List<DataRecord>>(
                        stream: queryDataRecord(
                          queryBuilder: (dataRecord) => dataRecord
                              .where('bookstatus', isEqualTo: 'pending'),
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
                          List<DataRecord> listViewDataRecordList =
                          snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewDataRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewDataRecord =
                              listViewDataRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'file_check_admin',
                                    queryParams: {
                                      'bookcheck': serializeParam(
                                        listViewDataRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          valueOrDefault<String>(
                                            listViewDataRecord.bookcover,
                                            'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                          ),
                                          width: 170,
                                          height: 230,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              8, 0, 0, 0),
                                          child: Text(
                                            listViewDataRecord.booktitle!,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                              color: Colors.black,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMediumFamily),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 0),
                                            child: Text(
                                              listViewDataRecord.author!,
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                                color: Colors.black,
                                                useGoogleFonts: GoogleFonts
                                                    .asMap()
                                                    .containsKey(
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMediumFamily),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.95, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: SelectionArea(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ei0d8h9h' /* Your file */,
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Cairo',
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              )),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: StreamBuilder<List<DataRecord>>(
                            stream: queryDataRecord(
                              queryBuilder: (dataRecord) => dataRecord
                                  .where('bookstatus', isEqualTo: 'approved'),
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
                              List<DataRecord> listViewDataRecordList =
                              snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewDataRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewDataRecord =
                                  listViewDataRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                        Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        enableDrag: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_model.unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.7,
                                                child: ViewBookInfoWidget(
                                                  bookinfo: listViewDataRecord
                                                      .reference,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              valueOrDefault<String>(
                                                listViewDataRecord.bookcover,
                                                'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                              ),
                                              width: 170,
                                              height: 230,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                              child: Text(
                                                listViewDataRecord.booktitle!,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMediumFamily,
                                                  color: Colors.black,
                                                  useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                      .containsKey(
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMediumFamily),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                                child: Text(
                                                  listViewDataRecord.author!,
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMediumFamily,
                                                    color: Colors.black,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 40, 8, 8),
                          child: SelectionArea(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qbuo57ev' /* Catogery */,
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Cairo',
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                              )),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                                child: StreamBuilder<List<DepramentRecord>>(
                                  stream: queryDepramentRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DepramentRecord>
                                    choiceChipsDepramentRecordList =
                                    snapshot.data!;
                                    return FlutterFlowChoiceChips(
                                      options: choiceChipsDepramentRecordList
                                          .map((e) => e.departmentName)
                                          .toList()
                                          .map((label) => ChipData(label!))
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                        _model.choiceChipsValue = val?.first);
                                        context.pushNamed(
                                          'department',
                                          queryParams: {
                                            'departmentname': serializeParam(
                                              choiceChipsDepramentRecordList
                                                  .first.departmentName,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                        ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                        ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      chipSpacing: 20,
                                      rowSpacing: 12,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                            [],
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 40, 8, 8),
                              child: SelectionArea(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'kmtmz81x' /* Department */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Cairo',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  )),
                            ),
                          ),
                          StreamBuilder<List<DepramentRecord>>(
                            stream: queryDepramentRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<DepramentRecord>
                              listViewDepramentRecordList = snapshot.data!;
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewDepramentRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewDepramentRecord =
                                  listViewDepramentRecordList[
                                  listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 340,
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 8, 8, 8),
                                            child: Text(
                                              listViewDepramentRecord
                                                  .departmentName!,
                                              style:
                                              TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,

                                              ),

                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color:
                                              Colors.white,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: StreamBuilder<
                                                  List<DataRecord>>(
                                                stream: queryDataRecord(
                                                  queryBuilder: (dataRecord) =>
                                                      dataRecord
                                                          .where('bookstatus',
                                                          isEqualTo:
                                                          'approved')
                                                          .where(
                                                          'departmentfilter',
                                                          arrayContains:
                                                          listViewDepramentRecord
                                                              .departmentName)
                                                          .orderBy(
                                                          'department'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                        CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<DataRecord>
                                                  listViewDataRecordList =
                                                  snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemCount:
                                                    listViewDataRecordList
                                                        .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewDataRecord =
                                                      listViewDataRecordList[
                                                      listViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                        Colors.transparent,
                                                        focusColor:
                                                        Colors.transparent,
                                                        hoverColor:
                                                        Colors.transparent,
                                                        highlightColor:
                                                        Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                            true,
                                                            backgroundColor:
                                                            Colors.transparent,
                                                            barrierColor: Colors.transparent,
                                                            enableDrag: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                    context)
                                                                    .requestFocus(
                                                                    _model
                                                                        .unfocusNode),
                                                                child: Padding(
                                                                  padding: MediaQuery.of(
                                                                      context)
                                                                      .viewInsets,
                                                                  child:
                                                                  Container(
                                                                    height:MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.7,
                                                                    child:
                                                                    ViewBookInfoWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color:
                                                          Color(0xFF292828),
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Image.network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewDataRecord
                                                                        .bookcover,
                                                                    'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                                  ),
                                                                  width: 170,
                                                                  height: 230,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      8,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                  child: Text(
                                                                    listViewDataRecord
                                                                        .booktitle!,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMedium
                                                                        .override(
                                                                      fontFamily:
                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts:
                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    child: Text(
                                                                      listViewDataRecord
                                                                          .author!,
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium
                                                                          .override(
                                                                        fontFamily:
                                                                        FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color:
                                                                        Colors.black,
                                                                        useGoogleFonts:
                                                                        GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
