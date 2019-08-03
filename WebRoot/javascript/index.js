//����js
$(document).ready(function(){
	// put the new albums into the front page but hide those starting from page 2
	
	for(var i=0;i<200;i++)
	{
		if(i>=4)
		{
			var b = "#"+i;
			$(b).hide();
		}
	}
	$("#sb1").css("background-color","white");
	// instantiate the scrolling animation's parameters
	var scroll = true;
	var scrollid = "leftarrow";
	var k=0;
	var lastdirection="";
	var sliders = new Array("#left", "#middle","#right"); //������ͼƬ
	var sliderpicture = new Array("images/long1.jpg","images/long2.jpg","images/long3.jpg","images/long4.jpg","images/long5.png");

	var sliderleft = $(sliders[0]);
	var slidermiddle = $(sliders[1]);
	var sliderright= $(sliders[2]);
	// set the scrolling animation variable to change the picture with every scroll   
	function setk(direction)
	{
		if(lastdirection=="")
		{
			lastdirection=direction;
			k=k-1;
			if(k<0)
			{
				k=4;
			}
			return k;

		}
		if(lastdirection==direction)
		{
			k=k-1;
			if(k<0)
			{
				k=4;
			}
		}

		lastdirection=direction;


		return k;

	}

	$(".smallbutton").click(function(){                     //�����ΪС��ť��div���л�ר������ʾ
		$(this).siblings().css("background-color","grey");
		$(this).css("background-color","white"); 
		swapimage($(this).attr("id"));  
	});
	function swapimage(id){       //flip the page and show another four new albums

		var btnid = id;
		var t = id.split("sb");
       start = 4*(t[1]-1);
       end = start+4;
		for(var i=0;i<16;i++)
		{
				var b = "#"+i;
				$(b).hide();
		}
		for(var i=start;i<end;i++)
		{
			
				var b = "#"+i;
				$(b).show();
		}


	}

	//animation for scroller
	function scrollanimation(id){
		slidermiddle.hover(function(){
			$(this).css("cursor","none");
		});

		var direction = id;

		sliderleft = $(sliders[0]);
		slidermiddle = $(sliders[1]);
		sliderright= $(sliders[2]);
		slidermiddle.hover(function(){
			$(this).css("cursor","pointer");
		});


		if(direction=="leftarrow")
		{

			slidermiddle.animate({left:'+=370px'},"fast").css("z-index","-1");
			slidermiddle.children("img").css("margin-top","25px").attr({width:'600',height:'250'},"fast");
			sliderright.animate({left:'-=750px'},"fast").css("z-index","-2");
			sliderleft.animate({left:'0px'},"fast").css("z-index","3");
			sliderleft.children("img").attr({width:'750',height:'300'},"fast").css("margin-top","0px");
			sliderright.children("img").attr({width:'600',height:'250'},"fast").css("margin-top","25px");
			sliderright.children("img").attr("src",sliderpicture[setk(id)]);
			var temp = sliders[2];
			for(var i=2;i>0;i--)
			{
				sliders[i]=sliders[i-1];
			}
			sliders[0]=temp;

		}

		else
		{

			slidermiddle.animate({left:'-=370px'},"fast").css("z-index","-1");
			slidermiddle.children("img").css("margin-top","25px").attr({width:'600',height:'250'},"fast");
			sliderleft.animate({left:'+=750px'},"fast").css("z-index","-2");
			sliderright.animate({left:'0px'},"fast").css("z-index","3");
			sliderright.children("img").attr({width:'750',height:'300'},"fast").css("margin-top","0px");
			sliderleft.children("img").attr({width:'600',height:'250'},"fast").css("margin-top","25px");
			sliderleft.children("img").attr("src",sliderpicture[setk(id)]);

			var temp = sliders[0];
			for(var i=0;i<2;i++)
			{
				sliders[i]=sliders[i+1];
			}
			sliders[2]=temp;
		}

		$(sliders[1]).hover(function(){
			$(this).css("cursor","pointer");
		});
		scroll = true;
		scrollid = id;

	}

	$(".leftrightarrow").click(function(){
		scrollanimation($(this).attr("id"));
		scroll = false;
	});

	//Ϊר������Ӹ���Ч��
	var orgback;
	$(".album").mouseenter(function(){
		orgback=$(this).find(".info,.info1" ).css("background-color"); 
	});
	$(".album").hover(function(){

		$(this).find(".info,.info1" ).css("background-color","RGB(98,172,219)");
		$(this).find(".info,.info1" ).css("opacity","1");
		////////////////////////////加入图片放大
	});
	$(".album").mouseleave(function(){

		$(this).find(".info,.info1").css("background-color",orgback);
		$(this).find(".info").css("opacity","0.5");
	});

	//Ϊ���Ҽ�ͷ��Ӹ���Ч��
	$(".leftrightarrow").mouseenter(function(){
		orgback=$(this).css("background-color");
	});

	$(".leftrightarrow").hover(function(){
		$(this).animate({width:'87px'},"slow").css("background-color","RGB(98,172,219)");

	});
	$(".leftrightarrow").mouseleave(function(){
		$(this).animate({width:'67px'},"slow").css("background-color",orgback);

	});
	//Ϊ���а����Ч��
	$(".inbox").hover(function(){
		$(this).css("opacity","1");

	});
	$(".inbox").mouseleave(function(){
		$(this).css("opacity","0.7");

	});
	//Ϊר�������ת
	$(".album").click(function(){
		var v = $(this).children(".front").children(".aimg").attr("alt");
		
		window.location.href="distinctitem.form?album="+v;
	});
	$("#middle").click(function(){
		window.location.href="distinctitem.form?album=001";
	});
	$("#left").click(function(){
		window.location.href="distinctitem.form?album=015";
	});
	$("#right").click(function(){
		window.location.href="distinctitem.form?album=003";
	});
	$("#ib0").click(function(){
		window.location.href="rankByPage.form?page=1&sign=sold";
	});
	$("#ib1").click(function(){
		window.location.href="rankByPage.form?page=1&sign=discount";
	});
	$("#ib2").click(function(){
		window.location.href="rankByPage.form?page=1&sign=wish";
	});
	$("#ib3").click(function(){
		window.location.href="rankByPage.form?page=1&sign=publishtime";
	});

	function al(){

		if(scroll==true)
		{
			scrollanimation(scrollid);

		}
		window.setTimeout(al,2500);
	}
	$("body").load(al());

});