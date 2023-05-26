<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://github.com/imhvost/chart-utils/blob/master/dist/chart-utils.min.js"></script> 
<input type="hidden" id="admInviStat" value="<%= request.getParameter("admInviStat") %>"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div class="body_wrapper">
<div style="width: 800px;height:800px;">
  <canvas id="myChart"></canvas>
</div>
</div>
<script>
const ctx = document.getElementById('myChart');
const year2021 = {
        label:'2021',
        data:[30,8,6,5,12,7],
        backgroundColor:'rgba(255,0,0,0.5)',
        borderColor:'#FFFFFF',
        borderWidth:1
}
const year2020 = {
        label:'2020',
        data:[5,10,5,3,4,2],
        backgroundColor:'rgba(203,206,145,.5)',
        borderColor:'#CBCE91',
        borderWidth:1
}

new Chart(ctx, {
  type: 'bar',
  data: {
	  labels:['반도체', '디스플레이', '전기전자', '자동차.철도', '철강', '조선'],
    datasets: [
    	 year2021,
         year2020
    ]
  },
  options: {
	  indexAxis: 'y',
	    // Elements options apply to all of the options unless overridden in a dataset
	    // In this case, we are setting the border of each horizontal bar to be 2px wide
	    elements: {
	      bar: {
	        borderWidth: 2,
	      }
	    },
	    responsive: true,
	    plugins: {
	      legend: {
	        position: 'right',
	      },
	      title: {
	        display: true,
	        text: '통계'
	      }
	    }
	  },
});

</script>