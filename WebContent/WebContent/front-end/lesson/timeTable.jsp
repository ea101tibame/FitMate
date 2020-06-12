<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeTable.css">
		<title>timeTable</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		
		
   		
	</head>
	<body>
		<div id="calendar">	
		
		<br>
		<div class='monyyyy'>
			<div >
				<div id="lastM"><<</div>
			</div>
			<div id = "MD"></div>
			<div >
				<div id="nextM" >>></div>
			</div>
		</div>
			<div id="calcontainer">
				<div id="calheader">
				</div>		
				<div id="daysweek">
					<div class="dayweek"><p>Sunday</p></div>
					<div class="dayweek"><p>Monday</p></div>
					<div class="dayweek"><p>Tuesday</p></div>
					<div class="dayweek"><p>Wednesday</p></div>
					<div class="dayweek"><p>Thursday</p></div>
					<div class="dayweek"><p>Friday</p></div>
					<div class="dayweek  brn"><p>Saturday</p></div>
					
				</div>
				<div id="daysmonth">
<!---------------------------------------- week 1 ---------------------------------------->
					<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>	
<!---------------------------------------- week 2 ---------------------------------------->
						<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>
<!---------------------------------------- week 3 ---------------------------------------->
						<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>
<!---------------------------------------- week 4 ---------------------------------------->
						<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>
<!---------------------------------------- week 5 ---------------------------------------->
						<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>
<!---------------------------------------- week 5 end ---------------------------------------->
<!---------------------------------------- week 6 ---------------------------------------->
						<div class="week">
						<div class="day">
							<div class="daybar"></div>
							<div class="dots">
							
							</div>	
							<!-- slide open -->
							<div class="open">
								
							</div>	
							<!-- slide closed -->
						</div>		
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>	
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
						<div class="day">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>				
						<div class="day brn">
							<div class="daybar"></div>
							<div class="dots"></div>	
							<!-- slide open -->
							<div class="open"></div>	
							<!-- slide closed -->
						</div>			
					</div>
<!---------------------------------------- week 6 end ---------------------------------------->
				</div>				
			</div>					
			<div id="calcat">
				
				<div class="caldot none"></div><p>可預約</p><br>
</div>				
</div>	
</div>
<script src="${pageContext.request.contextPath}/js/timeTable.js"></script>
</body>
</html></html>