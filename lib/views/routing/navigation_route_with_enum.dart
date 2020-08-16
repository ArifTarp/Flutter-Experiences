enum NavRoute{
  CARD_INFORMATIONS,
  DETAIL
}

String navigationRouteConverter(NavRoute route) {
  switch (route) {
    case NavRoute.CARD_INFORMATIONS:
      return "/cardInformationsView";
      break;
    case NavRoute.DETAIL:
      return "/detailView";
      break;
    default:
      print("Invalid Route");
      break;
  }
}