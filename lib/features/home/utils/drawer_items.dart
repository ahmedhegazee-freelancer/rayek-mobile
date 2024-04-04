part of '../main_screen_form.dart';

List<Widget> drawerItems = [

  SizedBox(
    height: 50.h,
  ),
  const _ImageDrawer(),
  SizedBox(
    height: 20.h,
  ),
  _CustomDrawer(
    title: Strings.home.tr(),
    icon: IconManager.home,
    onTap: () {
      MagicRouter.goBack();
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.categories.tr(),
    icon: IconManager.categories,
    onTap: () {
      MagicRouter.goBack();
      MagicRouter.navigateTo(const CategoriesView(isFromDrawer: true,));
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.appoints.tr(),
    icon: IconManager.appoints,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const MyAppointsView());
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.wallet.tr(),
    icon: IconManager.cash,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const Text("cash"));
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.blog.tr(),
    icon: IconManager.blog,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const Text("blog"));
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.contactUs.tr(),
    icon: IconManager.contactUs,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const ContactUsForm());
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.language.tr(),
    icon: IconManager.language,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const SelectLanguageForm());
    },
  ),
  SizedBox(
    height: 10.h,
  ),
  _CustomDrawer(
    title: Strings.signOut.tr(),
    icon: IconManager.signOut,
    iconColor: Colors.red,
    onTap: () {
      MagicRouter.goBack(); // To close the drawer
      MagicRouter.navigateTo(const Text("signOut"));
    },
  ),



];


class DrawerItems extends StatelessWidget {
  // key
  const DrawerItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List<Widget> drawerItems = [

      SizedBox(
        height: 50.h,
      ),
      const _ImageDrawer(),
      SizedBox(
        height: 20.h,
      ),
      SizedBox(
        height: 50.h,
      ),
      _CustomDrawer(
        title: Strings.home.tr(),
        icon: IconManager.home,
        onTap: () {
          MagicRouter.goBack();
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.categories.tr(),
        icon: IconManager.categories,
        onTap: () {
          MagicRouter.goBack();
          MagicRouter.navigateTo(const CategoriesView(isFromDrawer: true,));
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.appoints.tr(),
        icon: IconManager.appoints,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const MyAppointsView());
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.wallet.tr(),
        icon: IconManager.cash,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const Text("cash"));
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.blog.tr(),
        icon: IconManager.blog,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const BlogsForm());
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.contactUs.tr(),
        icon: IconManager.contactUs,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const ContactUsForm());
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.language.tr(),
        icon: IconManager.language,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const SelectLanguageForm());
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      _CustomDrawer(
        title: Strings.signOut.tr(),
        icon: IconManager.signOut,
        iconColor: Colors.red,
        onTap: () {
          MagicRouter.goBack(); // To close the drawer
          MagicRouter.navigateTo(const Text("signOut"));
        },
      ),



    ];


    return ListView(
      padding: EdgeInsets.zero,
      children: drawerItems,
    );
  }
}