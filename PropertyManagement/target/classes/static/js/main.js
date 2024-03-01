layui.use(['element'], function(){
	$ = layui.jquery;
	var element = layui.element;
  
  //导航的hover效果、二级菜单等功能，需要依赖element模块
  // larry-side-menu向左折叠
  	if($(window).width()<750){
		trun = 0;
	}else{
		trun = 1;
	}
	
$('.larry-side-menu').click(function() {
  if(trun){
			$('.x-side').animate({left: '0px'},200).siblings('.x-main').animate({left: '220px'},200);
			trun=0;
		}else{
			$('.x-side').animate({left: '-220px'},200).siblings('.x-main').animate({left: '0px'},200);
			trun=1;
		}

});



  	//监听导航点击
	element.on('nav(side)', function(elem){
		title = elem.find('cite').text();
		// 直接获取_href路径
		url = elem.attr('_href');

		// 如果_href为undefined，则不执行添加选项卡的操作
		if (url === undefined || url === 'undefined') {
			return;
		}

		for (var i = 0; i < $('.x-iframe').length; i++) {
			if ($('.x-iframe').eq(i).attr('src') == url) {
				element.tabChange('x-tab', i);
				return;
			}
		}

		res = element.tabAdd('x-tab', {
			title: title,
			content: '<iframe frameborder="0" src="' + url + '" class="x-iframe"></iframe>'
		});

		element.tabChange('x-tab', $('.layui-tab-title li').length - 1);

		$('.layui-tab-title li').eq(0).find('i').remove();
	});
});


