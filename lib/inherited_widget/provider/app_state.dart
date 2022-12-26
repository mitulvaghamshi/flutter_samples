class AppState {
  const AppState({required this.productList, this.itemsInCart = const {}});

  final List<String> productList;
  final Set<String> itemsInCart;

  AppState copyWith({List<String>? productList, Set<String>? itemsInCart}) {
    return AppState(
      productList: productList ?? this.productList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}
