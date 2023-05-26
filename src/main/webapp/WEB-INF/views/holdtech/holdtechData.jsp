<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="admInviStat" value="<%= request.getParameter("admInviStat") %>"/>
<link type="text/css" rel="stylesheet" href="/resources/css/world_map.css"  />
<script type="text/javascript" src="/resources/js/member/memberPopup.js"></script>
<script type="text/javascript" src="/resources/js/member/invitationList.js"></script>
<script type="text/javascript" src="/resources/js/member/commonSend.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://unpkg.com/topojson-client@3"></script>
<script src="https://d3js.org/queue.v1.min.js"></script>
<script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>
<div class="body_wrapper" style="    text-align: center;">
 <h1>보유기술 통계<span id="date"></span></h1>
<script>
            
                var width = 1200,
                    height = 700;
                
                var svg = d3.select(".body_wrapper").append("svg")
                    .attr("width", width)
                    .attr("height", height)
                    .attr("class", "map");
                
                var projection = d3.geoMercator()
                    .translate([width / 1.9, height / 1.5]);
                
                var path = d3.geoPath()
                    .projection(projection);
                
                var g = svg.append("g");
            
                var popById = d3.map();
                var covid = d3.map();
                var features = null;

                var newDate = new Date("2020-01-22T00:00:00");
                var newDateString = null;
                var size = null;
                
                queue()
                    .defer(d3.json, "https://unpkg.com/world-atlas@1/world/110m.json" )
                    .defer(d3.csv, "/resources/data/accumulated_covid_19_data.csv")
                    .defer(d3.csv, "/resources/data/world_country_id.csv", function(row){
                        popById.set(row.id, row.name);
                    })
                    .await(ready);
                
                function ready(error, geoData, covidData){

                        covidData.map(function(row){
                        var date = row.ObservationDate;

                        if (covid.has(date)){
                            covid.get(date).push({country : row["Country/Region"], confirmed : row.Confirmed});
                        }else{
                            covid.set(date, [{country : row["Country/Region"], confirmed : row.Confirmed}]);
                        }
                        });

                    features = topojson.feature(geoData, geoData.objects.countries).features;
                
                    // add country name using country code
                    features.forEach(function(d){
                        var countryName = popById.get(d.id);
                        if (countryName) d.properties.name = countryName;
                    
                    })
                
                    svg.selectAll("path")
                      .data(features)
                      .enter()
                      .append("path")
                      .attr("d", path)
                      .attr("stroke", "white")
                      .attr("stroke-width", 0.8)
                      .attr("fill", "#202020DE");
                      
                    
                    svg.selectAll("text")
                        .data(features)
                        .enter()
                        .append("text")
                        .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
                        .attr("dy", ".35em")
                        .attr("class", "country-label")
                        .text(function(d) { return d.properties.name});

                        svg.append("path");
                        var values = covidData.map(function(d){return d.Confirmed});

                    var valueExtent = d3.extent(values);

                    size = d3.scaleSqrt()
                            .domain(valueExtent)
                            .range([ 1, 28]);

                    var valuesToShow = [10000,100000,1000000]
                    var xCircle = 200
                    var xLabel = 320

                    svg
                        .selectAll("legend")
                        .data(valuesToShow)
                        .enter()
                        .append("circle")
                        .attr("cx", xCircle)
                        .attr("cy", function(d){ return height - size(d) - 50 } )
                        .attr("r", function(d){ return size(d) })
                        .style("fill", "none")
                        .attr("stroke", "black")

                    // Add legend: segments
                    svg
                        .selectAll("legend")
                        .data(valuesToShow)
                        .enter()
                        .append("line")
                        .attr('x1', function(d){ return xCircle + size(d) } )
                        .attr('x2', xLabel)
                        .attr('y1', function(d){ return height - size(d) - 50 } )
                        .attr('y2', function(d){ return height - size(d) - 50} )
                        .attr('stroke', 'black')
                        .style('stroke-dasharray', ('2,2'))

                    // Add legend: labels
                    svg
                        .selectAll("legend")
                        .data(valuesToShow)
                        .enter()
                        .append("text")
                        .attr('x', xLabel)
                        .attr('y', function(d){ return height - size(d) - 50 } )
                        .text( function(d){ return d } )
                        .style("font-size", 14)
                        .attr('alignment-baseline', 'middle')

                    redraw();

                    setInterval(redraw, 500);
                
                }



            var pullData = function(callback){

            newDateString = ("0"+(newDate.getMonth()+1)).slice(-2)+"/"+("0"+newDate.getDate()).slice(-2)+"/"+newDate.getFullYear();

            var result = covid.get(newDateString);

            if(result){


                var curData = [];
                features.map(function(d){
                    var curConfirmed = result.find(x => x.country == d.properties.name);

                    if(curConfirmed){
                        d.properties.confirmed = curConfirmed.confirmed;
                        curData.push(d);
                    }
                });
                date.innerText = newDateString;
                }else{
                    clearInterval(redraw);
                    return;
                }


            newDate.setDate(newDate.getDate() + 1);
            callback(curData);
            }

            var redraw = function(settings){
                pullData(redrawChart);  
            }

            var redrawChart = function(curData){
                //add circles
                svg.selectAll("circles")
                .data(curData)
                    .enter()
                    .append("circle")
                    .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
                    .attr("r", function(d) { return size(+d.properties.confirmed)})
                    .attr("fill", "#EC332020");
            }
            
</script>
</div>

<!-- <div class="BodyTopUtile ">
		<a href="#none" class="sch_btn">
				<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
					<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
				</svg>
		</a>
		
	
</div>
<div class="nctContentWrapper wrapTypq01">
	<div class="nctContentbody">
		<div class="no_list">
				조회된 검색 결과가 없습니다.
			</div>
		
	</div>
</div>	
<div class="nctContentFooter">
	
</div>	 -->
	
	
