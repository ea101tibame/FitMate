   
			function initMenu() {

				var block = $(".day");
					block.addClass("clickable");
					block.hover(function(){window.status = $(this)}, function(){window.status = ""});
				
				$('.open').hide();
				block.click(
					function() {
						$(this).parents('div:eq(0)').find('.open').slideToggle('fast');	
					}

				);}


			$(document).ready(function() {initMenu();});


	var monthName = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];//取值剛好4傳3 索引值3就是四月

    	//抓DOM
   	var lastM = document.getElementById("lastM");//要改變的按鈕 上個月
   	var MD = document.getElementById("MD");//填 現在的年月
   	var nextM = document.getElementById("nextM");//要改變的按鈕 下個月
   	var daybar = document.getElementsByClassName("daybar");//要插入日期的地方


	function clean(){
		var open = document.getElementsByClassName("open");
		var dots = document.getElementsByClassName("dots");
		for (var i = 0; i < 42; i++) {
		dots[i].innerHTML=`<div id = "dotsul${i}">
								<ul>
									<li class="none"></li>
									<li class="none"></li>
									<li class="none"></li>
								</ul>
							</div>`;
							

		open[i].innerHTML=`<div id = "openul${i}">
	 					<ul>
	 						<li class="none l4 a1"><p></p></li>
	 						<li class="none l4 a1"><p></p></li>
	 						<li class="none l4 a1"><p></p></li>						
	 					</ul>
	 					</div>`;
		}
	}

	clean();

	

   	function calender(daynow){
    		var year = Y;//現在的年
    		var month = M;//現在的月
    		var monthFirstday = new Date(year,month,1);
    		console.log(monthFirstday);
    		var week = monthFirstday.getDay();//今天的星期
    		console.log(week);
    		var day = 1;//從一開始的日期
    		var allday = isLeap(Y,M);//拿到當月日期總天數
    		resetAll();
    		console.log(week);
    		for(day=1; day<=allday ; day++){
    			//從星期幾開始 加上put位置從0開始 day要減一
    			daybar[week+day-1].innerText=day;
    		}  		
    		MD.innerText = monthName[M] +" "+ Y;
    	}


    	//現在時間
		function daynow(){
			today = new Date();
			D = today.getDay();//week 0是週日 1是一
			M = today.getMonth();//4月是傳3
			Y = today.getFullYear();
			var endDate = isLeap(Y);
			return today;
		}
		//閏年判斷
		function isLeap(Y,M){
			var isLeapYear = false;
			var feb_end = 28;
			if (Y % 4 === 0){
				isLeapYear = true;
				feb_end = 29;
			}
			if (Y % 100 === 0){
				isLeapYear = false;    
			}
			if (Y % 400 === 0){
				isLeapYear = true;
				feb_end = 29;
			}
			var lastd = [31, feb_end, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			return lastd[M];
		}
		//清除當前的日期
    	function resetAll(){
    		for(var i = 0 ; i<=41;i++){
    			daybar[i].innerHTML="-";
    		}

    	}
    	//改變下個月
    	function changeN(daynow){
    		var countM = 1;
    		var countY = 0;
    		newday = new Date(Y+countY,M+countM,1);

    		if((M+countM)==12){
    			countY++;
    		}

			D = newday.getDay();//week 0是週日 1是一
			M = newday.getMonth();//4月是傳3
			Y = newday.getFullYear();
			var endDate = isLeap(Y);
			return newday;
		}

		//改變上個月
    	function changeL(daynow){
    		var countM = 1;
    		var countY = 0;
    		newday = new Date(Y-countY,M-countM,1);

    		if((M-countM)==1){
    			countY--;
    		}

			D = newday.getDay();//week 0是週日 1是一
			M = newday.getMonth();//4月是傳3
			Y = newday.getFullYear();
			var endDate = isLeap(Y);
			return newday;
		}

//註冊事件 往上個月
	lastM.addEventListener("click",function(e){
		changeL();
		calender();
		clean();
		add();
	});

//註冊事件 往下個月
	nextM.addEventListener("click",function(e){
		changeN();
		calender();
		clean();
		add();
	});



	calender(daynow());

			//課表加入--------------------------------------------------------------
 	function add(daynow){
    		var year = Y;//現在的年
    		var month = M;//現在的月 五月是4 要加回來
    		
    		var monthFirstday = new Date(year,month,1);
    		console.log(monthFirstday);
    		var week = monthFirstday.getDay();//今天的星期
    		//時段tt 1.早上 2.下午 3.晚上
    		//JSON 多筆字串
 			//var datejson = `{"time":[{"yy":2020,"mm":6,"dd":10,"tt":1,"ss":"YOGA","href":"http://3.22.194.14/"},{"yy":2020,"mm":6,"dd":12,"tt":2,"ss":"YOGA","href":"http://google.com"},{"yy":2020,"mm":6,"dd":12,"tt":3,"ss":"BOXING","href":"http://3.22.194.14/"},{"yy":2020,"mm":6,"dd":14,"tt":3,"ss":"SURF","href":"http://3.22.194.14/"},{"yy":2020,"mm":7,"dd":14,"tt":2,"ss":"SURF","href":"http://3.22.194.14/"}]}`;
//    		var j ;
//    		document.getElementById("jsonDates").innerHTML = j;
    	;
    		$(document).ready(function() {
    			var obj = JSON.stringify($('#jsonDates').val());
    			console.log(obj);
    		});
    		;

//			var oobj = JSON.parse(jsonDates);
//			var oobjarr = oobj.time;
//
//			var  objlength = oobjarr.length;//array length
//
// 			for(let i=0 ; i <objlength ; i++){
//  			
//  			if(oobjarr[i].yy === year && (oobjarr[i].mm-1) === month ){
//
//  			var dayinner = oobjarr[i].dd+week-1;// dayinner   (week+day-1);
//
//  			var iddotsul = "dotsul"+(dayinner);
//  			var idopenul = "openul"+(dayinner);
//  			var link = "\""+oobjarr[i].href+"\"";
//
//  				console.log(link);
//  				// console.log("<a href=\""+oobjarr[i].href"\"><p>"+oobjarr[i].ss+"</p></a>");
//  				switch(oobjarr[i].tt){
//  					case 1:
//  					$("#"+iddotsul).find("li").eq(0).attr("class", "orange");
//  					$("#"+idopenul).find("li").eq(0).attr("class", "orange l4 a1");
//					$("#"+idopenul).find("li").eq(0).html("<a href="+link+"><p>"+oobjarr[i].ss+"</p></a>");
//					$("#"+idopenul).find("li").eq(0).attr("title","查看詳情");
//  					  	break;
//  					case 2:
//  					$("#"+iddotsul).find("li").eq(1).attr("class", "orange");
//  					$("#"+idopenul).find("li").eq(1).attr("class", "orange l4 a1");
//					$("#"+idopenul).find("li").eq(1).html("<a href="+link+"><p>"+oobjarr[i].ss+"</p></a>");
//					$("#"+idopenul).find("li").eq(1).attr("title","查看詳情");
//  						break;
//  					case 3:
//  					$("#"+iddotsul).find("li").eq(2).attr("class", "orange");
//  					$("#"+idopenul).find("li").eq(2).attr("class", "orange l4 a1");
//					$("#"+idopenul).find("li").eq(2).html("<a href="+link+"><p>"+oobjarr[i].ss+"</p></a>");
//					$("#"+idopenul).find("li").eq(2).attr("title","查看詳情");
//  						break;
//  				}  				
//  			}
//    	}
    }	

 add();
