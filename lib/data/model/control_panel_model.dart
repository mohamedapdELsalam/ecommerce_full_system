class ControlPanelCardModel {
  final String title;
  final String url;
  final void Function() onTap;
  ControlPanelCardModel({
    required this.title,
    required this.url,
    required this.onTap,
  });
}
