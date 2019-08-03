<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>charts</title>
     <script src="javascript/echarts.js"></script>
     <link rel="Shortcut Icon" href="images/ico128.png">
  </head>
  
  <body>


 <div id="main" style="width: 800px;height:400px; margin:0 auto;"></div>
 <div id="secondary" style="width: 800px;height:400px; margin:0 auto;"></div>
  <c:forEach var="alb" items="${topsell}" varStatus="status">  
  <hidden id="top${status.index}name" value="${alb.name}" style="display:none;">${alb.name}</hidden>
  <hidden id="top${status.index}value" value="${alb.sold}" style="display:none;">${alb.sold}</hidden>
  </c:forEach>
  
  <c:forEach var="alb1" items="${catagory}" varStatus="status">  
  <hidden id="catagory${status.index}name" value="${alb1.name}" style="display:none;">${alb1.name}</hidden>
  <hidden id="catagory${status.index}value" value="${alb1.sold}" style="display:none;">${alb1.sold}</hidden>
  </c:forEach>
  
  
  
  
  
  <script type="text/javascript">
        var arrayname = new Array();
        for(var i=0;i<8;i++)
        {
        var n = "top"+i+"name";
          arrayname[i] = document.getElementById(n).innerHTML;
        }
          var arrayvalue = new Array();
        for(var i=0;i<8;i++)
        {
          arrayvalue[i] = document.getElementById("top"+i+"value").innerHTML;
        }
  
  
      var carrayname = new Array();
        for(var i=0;i<10;i++)
        {
        var n = "catagory"+i+"name";
          carrayname[i] = document.getElementById(n).innerHTML;
        }
          var carrayvalue = new Array();
        for(var i=0;i<10;i++)
        {
          carrayvalue[i] = document.getElementById("catagory"+i+"value").innerHTML;
        }
  
  
  
  
  
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '销量商品数据（top8）'
            },
            tooltip: {
             trigger: 'item',
             formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                data:["总销量"]
            },
             toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
            xAxis: {
                data: arrayname//input the x-axis's name
            },
            yAxis: {},
            series: [{
                name: '总销量',
                type: 'bar',
                data: arrayvalue//input the x=axis's value
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>

<script type="text/javascript">
  var myChart = echarts.init(document.getElementById('secondary'));
  option = {
    title : {
        text: '各风格&语言歌曲销售占比',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        y : 'bottom',
        data:carrayname
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
             name:'风格',
            type:'pie',
            radius : [30, 110],
            center : ['23%', '50%'],
            roseType : 'area',
            label: {
                normal: {
                    show: true
                },
                emphasis: {
                    show: true
                }
            },
            lableLine: {
                normal: {
                    show: false
                },
                emphasis: {
                    show: true
                }
            },
            data:[{value:carrayvalue[0],name:carrayname[0]},
            {value:carrayvalue[1],name:carrayname[1]},
            {value:carrayvalue[2],name:carrayname[2]},
            {value:carrayvalue[3],name:carrayname[3]},
            {value:carrayvalue[4],name:carrayname[4]}]
        },
        {
            name:'语言',
            type:'pie',
            radius : [30, 110],
            center : ['75%', '50%'],
            roseType : 'area',
            data:[{value:carrayvalue[5],name:carrayname[5]},
            {value:carrayvalue[6],name:carrayname[6]},
            {value:carrayvalue[7],name:carrayname[7]},
            {value:carrayvalue[8],name:carrayname[8]},
            {value:carrayvalue[9],name:carrayname[9]}]
        }
    ]
};
  
  
  
  myChart.setOption(option);
</script>


  </body>
</html>
