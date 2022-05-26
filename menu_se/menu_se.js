//【メニューSE追加プラグイン】
// Ver.2.10 2022/5/27
// by hororo https://memocho.no-tenki.me/

(function(){

	const tag = {}; //タグ確認用…
	TYRANO.kag.tmp.memocho = TYRANO.kag.tmp.memocho || {}; //memocho専用領域

	//初期値代入用
	const se = {
		clickse : TYRANO.kag.stat.mp.clickse || "none",
		enterse : TYRANO.kag.stat.mp.enterse || "none",
		leavese : TYRANO.kag.stat.mp.leavese || "none",
		selector : ".menu_item img,.save_list_item,.button_smart,.button_menu,.remodal-confirm,.remodal-cancel,.menu_close"
	};

	//初期設定
	TYRANO.kag.tmp.memocho.menu_se = {
		"clickse" : se.clickse,
		"enterse" : se.enterse,
		"leavese" : se.leavese,
		"button_menu_clickse" : se.clickse,
		"button_menu_enterse" : se.enterse,
		"button_menu_leavese" : se.leavese,
		"menu_item_clickse" : se.clickse,
		"menu_item_enterse" : se.enterse,
		"menu_item_leavese" : se.leavese,
		"menu_close_clickse" : se.clickse,
		"menu_close_enterse" : se.enterse,
		"menu_close_leavese" : se.leavese,
		"save_list_clickse" : se.clickse,
		"save_list_enterse" : se.enterse,
		"save_list_leavese" : se.leavese,
		"button_smart_clickse" : se.clickse,
		"remodal-confirm_clickse" : se.clickse,
		"remodal-confirm_enterse" : se.enterse,
		"remodal-confirm_leavese" : se.leavese,
		"remodal-cancel_clickse" : se.clickse,
		"remodal-cancel_enterse" : se.enterse,
		"remodal-cancel_leavese" : se.leavese,
		"click_on" : 0,
		"selector" : se.selector
	};

	//イベント
	const se_event = function(selector) {
		$(document).on('mousedown.menu_se mouseenter.menu_se mouseleave.menu_se',selector,function(e){
			e.preventDefault();

			const menu_se = TYRANO.kag.tmp.memocho.menu_se;
			let etype = e.type.replace("mouse",""); //イベント名から mouse を削除
			if(etype == "down") etype = "click";  //clickだと発火しないボタンがあるのでmousedownで先に音鳴らす。

			//ボタンのclass名取得
			let button = $(this).attr("class");

			//メニューとセーブエリアの名前調整
			if(button != "menu_close" && $(this).parent().hasClass("menu_item")) button = "menu_item";
			else if($(this).hasClass('save_list_item')) button = "save_list";

			//classが複数ある場合
			let classVals = button.split(' ');  //配列に
			if(classVals.length>1){
				for (let element of classVals){
					if(menu_se.selector.indexOf(element) > -1){
						button = element;
						break; //一致したら終了
					}
				}
			}

			const storage = menu_se[button+"_"+etype+"se"];  //音声ファイル

			//playseを実行
			if(menu_se.click_on > 0){
				setTimeout(function(){menu_se.click_on = 0;},100); //画面切り替え直後はenter鳴らないように
			} else if(storage && storage!="none" && menu_se.click_on == 0){
				TYRANO.kag.ftag.startTag("playse",{storage:storage,stop:"true"}); //[playse]
				if(etype == "click"){
					menu_se.click_on ++; //クリック直後はSE無効にする
					setTimeout(function(){
						menu_se.click_on = 0;
					},700); //SE無効を解除※menuのfadeは300
				}
			}
		});
	};


	//[menu_se_set]
	tag.menu_se_set = {
		vital : ["name"],
		pm : {
			name : "",
			clickse : "",
			enterse : "",
			leavese : "",
			preload : false
		},
		start : function(pm) {
			preload(pm); //プリロード
			const menu_se = TYRANO.kag.tmp.memocho.menu_se;

			//nameの調整
			if(pm.name == "confirm" || pm.name == "cancel") pm.name = "remodal-" + pm.name;
			else if(pm.name == "menubutton") pm.name = "button_menu";

			//音声ファイルセット
			menu_se[pm.name+"_clickse"] = pm.clickse || menu_se[pm.name+"_clickse"] || menu_se.clickse;
			menu_se[pm.name+"_enterse"] = pm.enterse || menu_se[pm.name+"_enterse"] || menu_se.enterse;
			menu_se[pm.name+"_leavese"] = pm.leavese || menu_se[pm.name+"_leavese"] || menu_se.leavese;

			//selectorチェック
			if(menu_se.selector.indexOf(pm.name)==-1){
				menu_se.selector += ",." +pm.name; //無ければ突っ込んどく
			}

			$(document).off('.menu_se'); //イベント削除
			se_event(menu_se.selector); //イベント再設定

			TYRANO.kag.ftag.nextOrder(); //次のタグへ
		}
	};

	//ティラノのタグに登録
	TYRANO.kag.ftag.master_tag.menu_se_set = object(tag.menu_se_set);
	TYRANO.kag.ftag.master_tag.menu_se_set.kag = TYRANO.kag;


	//プリロード※デバッグ用
	const preload = function(pm) {
		if(pm.preload == "true"){
			let sound = [pm.clickse,pm.enterse,pm.leavese]; //とりあえず配列に
			let howl_array = "";
			for (let element of Howler._howls){
				howl_array += element._src; //登録済みファイルをテキトーに纏める。
			};
			sound.forEach(function (element, index) {
				if(howl_array.indexOf("./data/sound/" + element) > -1) sound[index] = ""; //登録済みなら削除
				else sound[index] = "./data/sound/" + element; //未登録ならフルパスに
			});
			sound = sound.filter(Boolean); //空欄を削除
			if(sound.length > 0) TYRANO.kag.ftag.startTag("preload",{storage:sound,stop:"true"});
		}
	};
	if(TYRANO.kag.stat.mp.clickse || TYRANO.kag.stat.mp.enterse || TYRANO.kag.stat.mp.leavese){
		preload(TYRANO.kag.stat.mp); //プリロード
		se_event(se.selector); //イベント設定
	}

}());
