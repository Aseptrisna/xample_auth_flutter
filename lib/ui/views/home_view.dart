import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/oauth_service.dart';
import 'package:flutter_oauth_example/ui/shared/shared_style.dart';
import 'package:flutter_oauth_example/ui/shared/ui_helper.dart';
import 'package:flutter_oauth_example/ui/widgets/button_widget.dart';
import 'package:flutter_oauth_example/ui/widgets/text_field_widget.dart';
import 'package:flutter_oauth_example/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
//import 'package:provider_architecture/provider_architecture.dart';
import 'package:stacked/stacked.dart';

// import flutter services
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model)=>{
        model.checkUser(context)
      },
      builder: (context, model, child) => Scaffold(
        body: LoadingOverlay(
          isLoading: model.busy,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      verticalSpaceMassive,
                      Text(
                        'Survey PPTIK',
                        style: titleTextStyle,
                      ),
                      verticalSpaceMassiveSignup,
                      Text(
                        'Username: ${model.loginData.username}',
                        style: titleTextStyle,
                      ),
                      verticalSpaceMassiveSignup,
                      Text(
                        'Name: ${model.loginData.first_name} ${model.loginData.last_name}',
                        style: titleTextStyle,
                      ),
                      verticalSpaceMassiveSignup,
                      Text(
                        'Email ${model.loginData.email}',
                        style: titleTextStyle,
                      ),
                      verticalSpaceMassiveSignup,
                      ButtonWidget(
                        title: 'Logout',
                        onPressedFunction: () {
                          print("AAA");
                          model.logout(context);
                        },
                      ),
                      verticalSpaceSmall,

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}