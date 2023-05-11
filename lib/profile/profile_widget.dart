import '/auth/firebase_auth/auth_util.dart';
import '/components/edit_info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 50.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.angleLeft,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 30.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidEdit,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (bottomSheetContext) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                _unfocusNode),
                                                    child: Padding(
                                                      padding: MediaQuery.of(
                                                              bottomSheetContext)
                                                          .viewInsets,
                                                      child: EditInfoWidget(
                                                        userinfo:
                                                            currentUserReference!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 12.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 8.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '244e1ulh' /* Email */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 8.0, 8.0),
                                    child: Text(
                                      currentUserEmail,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: Color(0x7BFFFFFF),
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 8.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'hi6frn0s' /* Collage */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Tajawal',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 8.0, 8.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                            currentUserDocument?.collage, ''),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Tajawal',
                                              color: Color(0x7BFFFFFF),
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
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
              Align(
                alignment: AlignmentDirectional(0.0, 0.6),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 18.0, 12.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 0.0, 6.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zgby0xkr' /* Language */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      80.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowLanguageSelector(
                                    width: 150.0,
                                    backgroundColor: Colors.black,
                                    borderColor: Color(0xFF262D34),
                                    dropdownIconColor: Color(0xFF14181B),
                                    borderRadius: 20.0,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13.0,
                                    ),
                                    hideFlags: false,
                                    flagSize: 20.0,
                                    flagTextGap: 8.0,
                                    currentLanguage: FFLocalizations.of(context)
                                        .languageCode,
                                    languages: FFLocalizations.languages(),
                                    onChanged: (lang) =>
                                        setAppLanguage(context, lang),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 18.0, 12.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 0.0, 6.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'hkd9if7i' /* Notification */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.9, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue1 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue!);
                                        },
                                        activeColor: Colors.black,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 18.0, 12.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 6.0, 0.0, 6.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'c82tvn43' /* Dark Mode */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.9, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue2 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue!);
                                          if (newValue!) {
                                            setDarkModeSetting(
                                                context, ThemeMode.dark);
                                          }
                                        },
                                        activeColor: Colors.black,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 18.0, 12.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Privecy');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 6.0, 0.0, 6.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'a9evqiye' /* Pravicy & policie */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('final_Singup', mounted);
                  },
                  text: FFLocalizations.of(context).getText(
                    'lmtd7ptl' /* Log out */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
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
            ],
          ),
        ),
      ),
    );
  }
}
