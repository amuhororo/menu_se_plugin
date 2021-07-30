/*  メニューSE追加プラグイン ver2.01 v507b対応  */
$(function(){
	//se_evnt()使うと呼び出し毎にon()が追加される
	$(".menu_item img,.save_list_item,.button_smart").on('click mouseenter mouseleave',function(e){
		se_add(e.type,$(this));
	})
});
