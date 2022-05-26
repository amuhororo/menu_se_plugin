# ティラノスクリプト用 メニューSE追加プラグイン


## 概要

「メニューボタン（旧歯車アイコン）」「メニュー画面の各ボタン」「セーブ・ロード領域」
「メニュー、セーブ、ロード、バックログの BACK ボタン」「ダイアログのボタン」
にSE（効果音）を指定するプラグインです。  

button・glink などにもSEを指定できます。（V2.00以降）
　　
### 出来ない事

- メニューのボタン別の設定はできません。（※改造はOK）
- メニューに追加したボタンには対応できません。（※改造はOK）
- メニューのclass名を変更した場合は動作しません。
- 本体改造をしてないので、若干微妙な所もあります。

### 微妙な点

- 公式標準の「タイトルに戻る」ダイアログの「OK」や「ロード」などのクリック音は、  
  SEの再生を待たずに画面が切り替わるので音が鳴らないか切れる場合があります。  
  （※環境や音声データによります）
- セーブ・ロードデータにenterを設定した場合、画面切替直後にenterのSEが鳴る場合があります。


## 使い方

1. data/others/plugin に 「menu_se」フォルダを入れてください。

2. ゲーム起動時に必ず読み込むファイル（first.ksなど）に下記コードを記述し、プラグインを呼び出してください。
   ```
   [plugin name=menu_se]
   ```

3. 全ボタン共通のデフォルト音声ファイルを指定する場合は、`plugin` タグにパラメータを追記します。  
   省略した場合は音声無しになります。
   ```
   [plugin name=menu_se clickse=click.ogg enterse=enter.ogg leavese=leave.ogg]
   ```

4. `[menu_se_set]` タグでボタン別に音声ファイルを指定します。詳しくは「パラメータ」を参照してください。
   ```
   [menu_se_set name=save_list clickse=click.ogg enterse=enter.ogg leavese=leave.ogg]
   ```


## パラメーター

### [plugin]タグ用（※不要な場合は省略可）

デフォルト設定（全てのボタンに同じSEを一括で指定します）  
省略時は `none` になります。

| パラメータ | 必須 | 説明 |
|------------|:----:|------|
| clickse    |  ×  | ボタンをクリックした時の音。*1 |
| enterse    |  ×  | ボタンの上にマウスカーソルが乗った時の音。*1 |
| leavese    |  ×  | ボタンの上からマウスカーソルが外れた時の音。*1 |

*1 省略した場合は `none` が入り、音声無しとなります。

### [menu_se_set]タグ用（※name以外は省略可）

| パラメータ | 必須 | 説明 |
|------------|:----:|------|
| name       |  ○  | ボタンの名前<br>※指定可能な値については下記参照
| clickse    |  ×  | ボタンをクリックした時の音。*2 |
| enterse    |  ×  | ボタンの上にマウスカーソルが乗った時の音。*2 |
| leavese    |  ×  | ボタンの上からマウスカーソルが外れた時の音。*2 |

*2 省略した場合は元の値が継承されます（前回の指定値＞デフォルト値）  
*2 音声指定を外したい場合は `none` を記述します。  

※`[menu_se_set]`タグは`[plugin name=menu_se]`の後に記述してください。  
※`[menu_se_set]`タグで指定したファイルが優先になります。  
※シナリオ途中での変更も可能です。make.ksへの追記は必要ありません。  
  元の音声に戻す場合は再度ファイル名を指定する必要があります。

#### [menu_se_set]タグのnameについて

- button_menu（メニューボタン）
- menu_item（メニュー画面のボタン）
- menu_close（閉じるボタン）
- save_list（セーブ・ロード）
- button_smart（スマホ用スクロールボタン）
- confirm（ダイアログのconfirm）
- cancel（ダイアログのcancel）
- 任意のname（button・glinkタグなどのnameを指定できます。）  
  ※他のタグの name に同じ名前を付けないよう注意してください。


## 記述例

### [plugin]

#### デフォルトの音声ファイルを指定する場合
```
[plugin name=menu_se clickse=click.ogg enterse=enter.ogg leavese=leave.ogg]
```

### [menu_se_set]使用例

#### メニュー画面のボタンとセーブデータにSEを指定する場合。
```
[plugin name=menu_se]
[menu_se_set name=menu_item clickse=menu_click.ogg enterse=menu_enter.ogg leavese=menu_leave.ogg]
[menu_se_set name=save_list clickse=save_click.ogg enterse=save_enter.ogg leavese=save_leave.ogg]
```

#### button タグ等に name を指定する事で、纏めてSEを設定する事ができます。
```
[menu_se_set name=se01 clickse=click.ogg enterse=enter.ogg leavese=leave.ogg]
[button name=se01 role=save]
[button name=se01 role=load]
```
※button・glink など対象以外のタグの `name` に同じ名前を付けないよう注意してください。  


## 注意事項

ティラノスクリプトの本体改造をしたくなかったので、動作がおかしな所もありますがご了承ください。  
気になる場合は、ご自身で本体を改造した方が安定するかと思います。


## 動作確認

ティラノスクリプト v513c


## 免責

このプラグインを使用したことにより生じた損害・損失に対して制作者は一切責任を負いません。


## 利用規約

- 改造・再配布は自由です。ただし、有償での再配布は禁止します。  
  改造後データの配布も同様にお願いします。
- 利用報告、クレジット表記は任意です。
- このプラグインはドネーションウェア（カンパウェア）です。  
  もしよろしければ寄付をお願いいたします（強制ではありません）
- 詳しくはブログの「利用規約」をお読み頂くようお願いいたします。  
  [https://memocho.no-tenki.me/terms](https://memocho.no-tenki.me/terms)


## 制作者

name    ： hororo  
site    ： めも調 [https://memocho.no-tenki.me/](https://memocho.no-tenki.me/)  
mail    ： ruru.amu@gmail.com  
twitter ： @hororo_memocho  


## 更新履歴

| 更新日     | Ver      | 詳細 |
|------------|----------|------|
| 2022/05/27 | ver2.10  | htmlへのコードペースト廃止。pluginタグ用パラメータを整理。コードを大幅に変更。
| 2021/07/30 | ver2.01  | htmlファイル同梱停止。機能変更なし。
| 2021/05/30 | ver2.00  | 個別指定用マクロ追加。メニューボタン指定名を「menubutton」から「button_menu」へ変更。コードを大幅に変更。
| 2021/02/28 | ver1.10a | 不要なコードを削除。
| 2020/08/27 | ver1.10  | ティラノv5に対応。共通パラメータを追加。
| 2019/08/15 | ver1.02  | ダイアログのSEを追加。他微調整。
| 2018/02/26 | ver1.01  | クリック時のイベントをPCとスマホで切り替えるように変更。他微調整。
| 2017/10/02 | ver1.00  | 公開
