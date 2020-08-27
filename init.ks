;【メニューSE追加プラグイン Ver.1.03 v504a対応】
; 2020/8/27更新　by hororo http://hororo.wp.xdomain.jp/
[iscript]

//まとめ指定用
  mp.se_clickse =  mp.se_clickse || "none";
  mp.se_enterse =  mp.se_enterse || "none";
  mp.se_leavese =  mp.se_leavese || "none";

//メニューボタン（歯車）
  mp.menubutton_clickse = mp.menubutton_clickse  || mp.se_clickse;  //ボタンをクリックした時
  mp.menubutton_enterse = mp.menubutton_enterse  || mp.se_enterse;  //ボタンの上にマウスカーソルが乗った時
  mp.menubutton_leavese = mp.menubutton_leavese  || mp.se_leavese;  //ボタンの上からマウスカーソルが外れた時
TG.kag.tmp.menu_se = {

//メニュー画面のボタン
  menu_item_clickse    : mp.menu_item_clickse    || mp.se_clickse,  //ボタンをクリックした時
  menu_item_enterse    : mp.menu_item_enterse    || mp.se_enterse,  //ボタンの上にマウスカーソルが乗った時
  menu_item_leavese    : mp.menu_item_leavese    || mp.se_leavese,  //ボタンの上からマウスカーソルが外れた時

//メニュー/セーブ/ロード/バックログの閉じるボタン
  menu_close_clickse   : mp.menu_close_clickse   || mp.se_clickse,  //ボタンをクリックした時
  menu_close_enterse   : mp.menu_close_enterse   || mp.se_enterse,  //ボタンの上にマウスカーソルが乗った時
  menu_close_leavese   : mp.menu_close_leavese   || mp.se_leavese,  //ボタンの上からマウスカーソルが外れた時

//セーブ/ロードリスト
  save_list_clickse    : mp.save_list_clickse    || mp.se_clickse,  //ボタンをクリックした時
  save_list_enterse    : mp.save_list_enterse    || mp.se_enterse,  //ボタンの上にマウスカーソルが乗った時
  save_list_leavese    : mp.save_list_leavese    || mp.se_leavese,  //ボタンの上からマウスカーソルが外れた時

//セーブ/ロード/バックログのスマホ用スクロールボタン
  button_smart_clickse : mp.button_smart_clickse || mp.se_clickse   //ボタンをクリックした時
}
//ダイアログのconfirm（OK）ボタン
  mp.confirm_clickse  =  mp.confirm_clickse      || mp.se_clickse;  //ボタンをクリックした時
  mp.confirm_enterse  =  mp.confirm_enterse      || mp.se_enterse;  //ボタンの上にマウスカーソルが乗った時
  mp.confirm_leavese  =  mp.confirm_leavese      || mp.se_leavese;  //ボタンの上からマウスカーソルが外れた時

//ダイアログのcancelボタン
  mp.cancel_clickse   =  mp.cancel_clickse       || mp.se_clickse;  //ボタンをクリックした時
  mp.cancel_enterse   =  mp.cancel_enterse       || mp.se_enterse;  //ボタンの上にマウスカーソルが乗った時
  mp.cancel_leavese   =  mp.cancel_leavese       || mp.se_leavese;  //ボタンの上からマウスカーソルが外れた時






var click_on;
$(".button_menu").on({
	"touchstart click": function(e) {
		click_on ++;
		if(mp.menubutton_clickse!="none")TG.ftag.startTag("playse",{storage:mp.menubutton_clickse,stop:"true"});
		e.preventDefault();
	},
	"mouseenter": function() {
		click_on = 0;
		if(mp.menubutton_enterse!="none")TG.ftag.startTag("playse",{storage:mp.menubutton_enterse,stop:"true"});
	},
	"mouseleave": function() {
		if(mp.menubutton_leavese!="none" && click_on==0)TG.ftag.startTag("playse",{storage:mp.menubutton_leavese,stop:"true"});
	}
});

//モーダル用
$(".remodal-confirm").on({
	"touchstart click": function(e) {
			click_on ++;
			if(mp.confirm_clickse!="none")TG.ftag.startTag("playse",{storage:mp.confirm_clickse,stop:"true"});
		e.preventDefault();
	},
	"mouseenter": function() {
		click_on = 0;
		if(mp.confirm_enterse!="none")TG.ftag.startTag("playse",{storage:mp.confirm_enterse,stop:"true"});
	},
	"mouseleave": function() {
		if(mp.confirm_leavese!="none" && click_on==0)TG.ftag.startTag("playse",{storage:mp.confirm_leavese,stop:"true"});
	}
});
$(".remodal-cancel").on({
	"touchstart click": function(e) {
			click_on ++;
			if(mp.cancel_clickse!="none")TG.ftag.startTag("playse",{storage:mp.cancel_clickse,stop:"true"});
			e.preventDefault();
	},
	"mouseenter": function() {
		click_on = 0;
		if(mp.cancel_enterse!="none")TG.ftag.startTag("playse",{storage:mp.cancel_enterse,stop:"true"});
	},
	"mouseleave": function() {
		if(mp.cancel_leavese!="none" && click_on==0)TG.ftag.startTag("playse",{storage:mp.cancel_leavese,stop:"true"});
	}
});


$('head link:last').after('<style>html { -ms-touch-action: none; touch-action: manipulation;}</style>');
$('head meta:last').after('<meta name="viewport" content="width=device-width">');
[endscript]

;※※----他のシステム系プラグインを使う場合は、ここから-------------------------------
[sysview type="menu" storage="./data/others/plugin/menu_se/html/menu.html"]
[sysview type="load" storage="./data/others/plugin/menu_se/html/load.html"]
[sysview type="save" storage="./data/others/plugin/menu_se/html/save.html"]
[sysview type="backlog" storage="./data/others/plugin/menu_se/html/backlog.html"]
;※※----ここまで削除--------------------------------------------------------------

[return]
