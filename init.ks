;【メニューSE追加プラグイン Ver2.01 v507b対応】
; 2021/07/30更新　by hororo http://hororo.wp.xdomain.jp/
[iscript]

//---初期設定-----------------------------------------------------------------------------------------------
//まとめ指定用
	mp.se_clickse  =  mp.se_clickse || "none" ;
	mp.se_enterse  =  mp.se_enterse || "none" ;
	mp.se_leavese  =  mp.se_leavese || "none" ;

TG.kag.tmp.menu_se = {
	//メニューボタン（menubuttonは旧Ver互換用）
	"button_menu_clickse"  : mp.button_menu_clickse  || mp.menubutton_clickse  || mp.se_clickse  //ボタンをクリックした時
,	"button_menu_enterse"  : mp.button_menu_enterse  || mp.menubutton_enterse  || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"button_menu_leavese"  : mp.button_menu_leavese  || mp.menubutton_leavese  || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//メニュー画面のボタン
,	"menu_item_clickse"    : mp.menu_item_clickse    || mp.se_clickse  //ボタンをクリックした時
,	"menu_item_enterse"    : mp.menu_item_enterse    || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"menu_item_leavese"    : mp.menu_item_leavese    || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//メニュー/セーブ/ロード/バックログの閉じるボタン
,	"menu_close_clickse"   : mp.menu_close_clickse   || mp.se_clickse  //ボタンをクリックした時
,	"menu_close_enterse"   : mp.menu_close_enterse   || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"menu_close_leavese"   : mp.menu_close_leavese   || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//セーブ/ロードリスト
,	"save_list_clickse"    : mp.save_list_clickse    || mp.se_clickse  //ボタンをクリックした時
,	"save_list_enterse"    : mp.save_list_enterse    || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"save_list_leavese"    : mp.save_list_leavese    || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//セーブ/ロード/バックログのスマホ用スクロールボタン
,	"button_smart_clickse" : mp.button_smart_clickse || mp.se_clickse  //ボタンをクリックした時

//ダイアログのconfirm（OK）ボタン
,	"remodal-confirm_clickse"  :  mp.confirm_clickse || mp.se_clickse  //ボタンをクリックした時
,	"remodal-confirm_enterse"  :  mp.confirm_enterse || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"remodal-confirm_leavese"  :  mp.confirm_leavese || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//ダイアログのcancelボタン
,	"remodal-cancel_clickse"   :  mp.cancel_clickse  || mp.se_clickse  //ボタンをクリックした時
,	"remodal-cancel_enterse"   :  mp.cancel_enterse  || mp.se_enterse  //ボタンの上にマウスカーソルが乗った時
,	"remodal-cancel_leavese"   :  mp.cancel_leavese  || mp.se_leavese  //ボタンの上からマウスカーソルが外れた時

//---初期設定終了-----------------------------------------------------------------------------------------------



,	"se_clickse"   :  mp.se_clickse
,	"se_enterse"   :  mp.se_enterse
,	"se_leavese"   :  mp.se_leavese
,	"click_on" : 0
, "selector" : ".button_menu,.remodal-confirm,.remodal-cancel"
}
[endscript]
[loadjs storage="plugin/menu_se/menu_se_base.js"]


[macro name=menu_se_set]
	[iscript]
		se_set(mp);
	[endscript]
[endmacro]


[return]
