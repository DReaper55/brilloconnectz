import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/strings.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrilloScaffold extends HookConsumerWidget {
   const BrilloScaffold({super.key,
        required this.child,
        this.titleStyle,
        this.padding,
        this.showAccountButton,
        this.floatingActionButton,
        this.showAppBarDivider = true,
        this.showLeadingBtn = true,
        this.title,
        this.scaffoldKey,
        this.centerTile = false,
        this.actions});

  final Widget child;
  final String? title;
  final FloatingActionButton? floatingActionButton;
  final TextStyle? titleStyle;
  final bool? centerTile;
  final EdgeInsets? padding;
  final List<Widget>? actions;
  final bool showLeadingBtn;
  final bool? showAccountButton;
  final bool? showAppBarDivider;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      appBar: AppBar(
        leading: (){
          if(!showLeadingBtn) {
            return const SizedBox();
          }

          return InkWell(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_back_ios),
              ));
        }(),
        leadingWidth: (){
          if(!showLeadingBtn) {
            return 0.0;
          }
          return 40.0;
        }(),
        title: Text(
          title ?? AppStrings.name,
          style: titleStyle ??
              Styles.w600(
                color: BrilloColors.black,
              ),
        ),
        actions: () {
          List<Widget> mActions = [];
          List<Widget> fixedActions = [

            if(showAccountButton != null && showAccountButton!)
              const AccountSwitcher(),
          ];

          if (actions != null) {
            mActions.addAll(actions!);
          }


          mActions.addAll(fixedActions);

          return mActions;
        }(),
        centerTitle: centerTile ?? true,
      ),
      floatingActionButton: floatingActionButton,
      body: Column(
        children: [
          if(showAppBarDivider != null && showAppBarDivider!)
            Container(height: 1.0, width: Helpers.width(context), color: Colors.grey.shade300,),
          Expanded(
            child: Padding(
              padding: padding ?? const EdgeInsets.fromLTRB(Dimensions.big, 0.0, Dimensions.big, Dimensions.big),
              child: child,
            ),
          ),
          Container(
            height: 1.0,
            width: Helpers.width(context),
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

class AccountSwitcher extends StatelessWidget {
  const AccountSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10.0, left: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(
            radius: 15.0,
            child: Icon(Icons.person)
                ),
      ),
    );
  }
}
