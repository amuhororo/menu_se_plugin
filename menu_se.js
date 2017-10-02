var menu_se = TYRANO.kag.tmp.menu_se;
var click_on = false;
 
//メニューのボタン
$(".menu_save,.menu_load,.menu_window_close,.menu_skip,.menu_back_title").on({
	"click": function() {
		click_on = true;
		if(menu_se.menu_item_clickse!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_item_clickse,stop:"true"});
	},
	"mouseenter": function() {
		if(menu_se.menu_item_enterse!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_item_enterse,stop:"true"});
		click_on = false;
	},
	"mouseleave": function() {
		if(menu_se.menu_item_leavese!="none" && click_on==false)TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_item_leavese,stop:"true"});
	}
});

//閉じるボタン
$(".menu_close").on({
	"click": function() {
		click_on = true;
		if(menu_se.menu_close_clickse!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_close_clickse,stop:"true"});
	},
	"mouseenter": function() {
		if(menu_se.menu_close_enterse!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_close_enterse,stop:"true"});
		click_on = false;
	},
	"mouseleave": function() {
		if(menu_se.menu_close_leavese!="none" && click_on == false)TYRANO.kag.ftag.startTag("playse",{storage:menu_se.menu_close_leavese,stop:"true"});
	}
});


//セーブデータ
$(".save_list_item").on({
	"click": function() {
		if(menu_se.save_list_clickse!="none"){
			click_on = true;
			TYRANO.kag.ftag.startTag("playse",{storage:menu_se.save_list_clickse,stop:"true"});
		}
	},
	"mouseenter": function() {
		if(menu_se.save_list_enterse!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.save_list_enterse,stop:"true"});
		click_on = false;
	},
	"mouseleave": function() {
		if(menu_se.save_list_leavese!="none")TYRANO.kag.ftag.startTag("playse",{storage:menu_se.save_list_leavese,stop:"true"});
	}
});


//セーブ・バックログのスマホ用ボタン
if(menu_se.button_smart_clickse!="none"){
	$(".button_smart").click(function(){
		TYRANO.kag.ftag.startTag("playse",{storage:menu_se.button_smart_clickse,stop:"true"});
	});
};		

