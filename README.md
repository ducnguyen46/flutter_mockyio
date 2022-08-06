# wdb106_sample

- [WEB+DB PRESS Vol.106](https://www.amazon.co.jp/dp/4774199435?tag=mono0926-22) の特集1の「実践Android/iOSアプリ設計」のサンプルをFlutterではどう書くのかというサンプル
  - 元のサンプルは [サポートページ：WEB+DB PRESS Vol.106](http://gihyo.jp/magazine/wdpress/archive/2018/vol106/support) からダウンロード可能

## 内容概要

- 以下のパッケージを組み合わせたパターン
    - [Riverpod](https://riverpod.dev) の [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
        - [flutter_hooks](https://pub.dev/packages/flutter_hooks)は `ref.watch()` のためだけに利用
    - [state_notifier](https://pub.dev/packages/state_notifier)
    - [freezed](https://pub.dev/packages/freezed)
- 自動テストをほぼ網羅
  - 自動スモークテスト(Widgetテスト)も対応
- JSON APIは http://www.mocky.io で用意


商品リスト | カート
--- | ---
![商品リスト](screen_shots/1.png) | ![カート](screen_shots/2.png)

# Provider graph

Generated by https://github.com/rrousselGit/riverpod/tree/master/packages/riverpod_graph

```mermaid
flowchart TB
  subgraph Arrows
    direction LR
    start1[ ] -..->|read| stop1[ ]
    style start1 height:0px;
    style stop1 height:0px;
    start2[ ] --->|listen| stop2[ ]
    style start2 height:0px;
    style stop2 height:0px;
    start3[ ] ===>|watch| stop3[ ]
    style start3 height:0px;
    style stop3 height:0px;
  end

  subgraph Type
    direction TB
    ConsumerWidget((widget));
    Provider[[provider]];
  end
  _ListView((_ListView));
  itemStocksProvider ==> _ListView;
  _CartButton((_CartButton));
  cartProvider ==> _CartButton;
  cartProvider ==> _CartButton;
  ItemTile((ItemTile));
  itemStocksProvider ==> ItemTile;
  itemQuantityProviders ==> ItemTile;
  _AddButton((_AddButton));
  hasStockProviders ==> _AddButton;
  cartProvider -.-> _AddButton;
  CartPage((CartPage));
  cartProvider --> CartPage;
  _ListView((_ListView));
  cartProvider ==> _ListView;
  CartHeader((CartHeader));
  cartTotalPriceLabelProvider ==> CartHeader;
  CartTile((CartTile));
  itemStocksProvider ==> CartTile;
  cartProvider ==> CartTile;
  cartProvider -.-> CartTile;
  App((App));
  routerProvider ==> App;
  itemStocksProvider[[itemStocksProvider]];
  httpClientProvider ==> itemStocksProvider;
  httpClientProvider[[httpClientProvider]];
  itemQuantityProviders[[itemQuantityProviders]];
  itemStocksProvider ==> itemQuantityProviders;
  cartProvider ==> itemQuantityProviders;
  cartProvider[[cartProvider]];
  hasStockProviders[[hasStockProviders]];
  itemQuantityProviders ==> hasStockProviders;
  cartTotalPriceLabelProvider[[cartTotalPriceLabelProvider]];
  cartTotalPriceProvider ==> cartTotalPriceLabelProvider;
  cartTotalPriceProvider[[cartTotalPriceProvider]];
  cartProvider ==> cartTotalPriceProvider;
  itemStocksProvider ==> cartTotalPriceProvider;
  routerProvider[[routerProvider]];
  ```
