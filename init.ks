;【メニューSE追加プラグイン Ver.1.00】
; 2017/10/2更新　by hororo http://hororo.wp.xdomain.jp/
[iscript]

//メニューボタン（歯車）
  mp.menubutton_clickse = mp.menubutton_clickse  || "none";  //ボタンをクリックした時
  mp.menubutton_enterse = mp.menubutton_enterse  || "none";  //ボタンの上にマウスカーソルが乗った時
  mp.menubutton_leavese = mp.menubutton_leavese  || "none";  //ボタンの上からマウスカーソルが外れた時
TG.kag.tmp.menu_se = {

//メニュー画面のボタン
  menu_item_clickse    : mp.menu_item_clickse    || "none",  //ボタンをクリックした時
  menu_item_enterse    : mp.menu_item_enterse    || "none",  //ボタンの上にマウスカーソルが乗った時
  menu_item_leavese    : mp.menu_item_leavese    || "none",  //ボタンの上からマウスカーソルが外れた時

//メニュー/セーブ/ロード/バックログの閉じるボタン
  menu_close_clickse   : mp.menu_close_clickse   || "none",  //ボタンをクリックした時
  menu_close_enterse   : mp.menu_close_enterse   || "none",  //ボタンの上にマウスカーソルが乗った時
  menu_close_leavese   : mp.menu_close_leavese   || "none",  //ボタンの上からマウスカーソルが外れた時

//セーブデータ
	save_list_clickse    : mp.save_list_clickse    || "none",  //ボタンをクリックした時
	save_list_enterse    : mp.save_list_enterse    || "none",  //ボタンの上にマウスカーソルが乗った時
	save_list_leavese    : mp.save_list_leavese    || "none",  //ボタンの上からマウスカーソルが外れた時

//セーブ/ロード/バックログのスマホ用スクロールボタン
  button_smart_clickse : mp.button_smart_clickse || "none"   //ボタンをクリックした時

}



var click_on = false;
$(".button_menu").on({
	"click": function() {
		click_on = true;
		if(mp.menubutton_clickse!="none")TG.ftag.startTag("playse",{storage:mp.menubutton_clickse,stop:"true"});
	},
	"mouseenter": function() {
		if(mp.menubutton_enterse!="none")TG.ftag.startTag("playse",{storage:mp.menubutton_enterse,stop:"true"});
		click_on = false;
	},
	"mouseleave": function() {
		if(mp.menubutton_leavese!="none" && click_on==false)TG.ftag.startTag("playse",{storage:mp.menubutton_leavese,stop:"true"});
	}
});
[endscript]

[sysview type="menu" storage="./data/others/plugin/menu_se/html/menu.html"]
[sysview type="load" storage="./data/others/plugin/menu_se/html/load.html"]
[sysview type="save" storage="./data/others/plugin/menu_se/html/save.html"]
[sysview type="backlog" storage="./data/others/plugin/menu_se/html/backlog.html"]

[return]