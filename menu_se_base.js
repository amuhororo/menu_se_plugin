/*  メニューSE追加プラグイン ver2.01 v507b対応  */

$(function(){
	$('.button_menu,.remodal-confirm,.remodal-cancel').on('click mouseenter mouseleave',function(e){
		se_add(e.type,$(this));
	})
});


function se_event(selector) {
	$('#tyrano_base').on('click mouseenter mouseleave',selector,function(e){
		se_add(e.type,$(this));
	})
};


function se_add(e,btn) {
	const menu_se = TYRANO.kag.tmp.menu_se;

	//ボタンのclass名取得して調整
	let button = btn.attr("class");
	if(button != "menu_close" && btn.parent().hasClass("menu_item")) button = "menu_item";
	else if(btn.hasClass('save_list_item')) button = "save_list";
	//classが複数ある場合
	let classVals = button.split(' ');  //配列に
	if(classVals.length>1){
		for (let i = 0; i < classVals.length; i++) {
			if(menu_se.selector.indexOf(classVals[i]) > -1){
				button = classVals[i];
				break; //一致したら終了
			}
		}
	}

	//イベント名から mouse を削除
	if(e.indexOf("mouse") > -1) e = e.replace("mouse","");

	//playseを実行
	let se_name = menu_se[button+"_"+e+"se"];  //音声ファイル
	if(se_name && se_name!="none" && !menu_se.click_on){
		TYRANO.kag.ftag.startTag("playse",{storage:se_name,stop:"true"});
		if(e == "click"){
			menu_se.click_on ++; //クリック直後はSE無効にする
			setTimeout(function(){menu_se.click_on = 0},500); //SE無効を解除※menuのfadeは300
		}
	}
};



//セットマクロ用
function se_set(pm) {
	const menu_se = TYRANO.kag.tmp.menu_se;

	//nameの調整
	if(pm.name == "confirm" || pm.name == "cancel") pm.name = "remodal-" + pm.name;
	else if(pm.name == "menubutton") pm.name = "button_menu";

	//seセット
	menu_se[pm.name+"_clickse"] = pm.clickse || menu_se[pm.name+"_clickse"] || menu_se.se_clickse;
	menu_se[pm.name+"_enterse"] = pm.enterse || menu_se[pm.name+"_enterse"] || menu_se.se_enterse;
	menu_se[pm.name+"_leavese"] = pm.leavese || menu_se[pm.name+"_leavese"] || menu_se.se_leavese;

	//イベントが無ければ追加
	if(menu_se.selector.indexOf(pm.name)==-1){
		if(pm.name != "save_list" && pm.name != "menu_item" && pm.name != "menu_close" && pm.name != "button_smart"){
			menu_se.selector += ",." +pm.name; //イベント有無チェック用にselectorに突っ込んどく
			se_event("." +pm.name)
		}
	}
};
