<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="ObjQues.css">
<title>Poll results</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>

<h1 class="chart_title">Poll Results</h1>

	<div class="chartdiv">
		<div class="cdiv1">
			<canvas id="myChart1" style="max-width:600px;max-height:200px;"></canvas>
			<canvas id="myChart2" style="max-width:600px;max-height:200px;"></canvas>
		</div>
		<div class="cdiv2">
			<canvas id="myChart3" style="max-width:600px;max-height:200px;"></canvas>
			<canvas id="myChart4" style="max-width:600px;max-height:200px;"></canvas>

		</div>
	</div>


	<%
		int[] ans1 = new int[4];
		int[] ans2 = new int[4];
		int[] ans3 = new int[4];
		int[] ans4 = new int[4];
		ans1 = (int[]) session.getAttribute("q1");
		ans2 = (int[]) session.getAttribute("q2");
		ans3 = (int[]) session.getAttribute("q3");
		ans4 = (int[]) session.getAttribute("q4");

		System.out.println("Ans2:  ");
		for (int i = 0; i < ans2.length; i++) {
			System.out.println(ans2[i]);
		}
	%>
	<script>
		var jsArr1 = new Array();
	<%for (int j = 0; j < ans1.length; j++) {%>
		jsArr1[<%=j%>] =<%=ans1[j]%>;
	<%}%>
		console.log(jsArr1)

		var xValues = [ "Highly Satisfactory ", "Satisfactory",
				"Averagely Satisfactory", "Dissatisfactory" ];
		var barColors = [ "red", "green", "blue", "orange" ];
		new Chart("myChart1", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : jsArr1,
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						barPercentage : 0.4
					} ]

				},
				legend : {
					display : false
				},
				title : {

					display : true,
					text : "Question 1",
				 	fontSize: 30 
				        }
			
			}
		});

		//----------------------------------------------------------------

		var jsArr2 = new Array();
	<%for (int j = 0; j < ans2.length; j++) {%>
		jsArr2[<%=j%>] =<%=ans2[j]%>;
	<%}%>
		console.log(jsArr2)
		new Chart("myChart2", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : jsArr2,
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						barPercentage : 0.4
					} ]

				},
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "Question 2",
					fontSize: 30 

				}
			}
		});

		//-------------------------------------------------------------
		var jsArr3 = new Array();
	<%for (int j = 0; j < ans3.length; j++) {%>
		jsArr3[<%=j%>] =<%=ans3[j]%>;
	<%}%>
		console.log(jsArr3)
		new Chart("myChart3", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : jsArr3,
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						barPercentage : 0.4
					} ]

				},
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "Question 3",
					fontSize: 30 

				}
			}
		});

		//---------------------------------------------------
		var jsArr4 = new Array();
	<%for (int j = 0; j < ans4.length; j++) {%>
		jsArr4[<%=j%>] =<%=ans4[j]%>;
	<%}%>
		console.log(jsArr4)
		new Chart("myChart4", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : jsArr4,
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						barPercentage : 0.4
					} ]

				},
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "Question 4",
					fontSize: 30 

				}
			}
		});
	</script>

</body>





</html>