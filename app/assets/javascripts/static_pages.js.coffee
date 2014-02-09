//= require d3/d3
//= require d3-cloud/d3.layout.cloud

$(document).ready ->

  $.ajax '/tags.json',
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
        $('#tags_container').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) -> drawWordCloud(data)
	
	draw = (words) ->
	  d3.select("#tags_container").append("svg").attr("width", 300)
	  .attr("height", 300).append("g").attr("transform", "translate(150,150)")
	  .selectAll("text").data(words).enter()
	  .append("text").style("font-size", (d) -> d.size + "px")
	  .style("font-family", "Arial")
	  .style("fill", (d, i) -> fill i)
	  .attr("text-anchor", "middle")
	  .attr("transform", (d) -> "translate(" + [ d.x, d.y ] + ")rotate(" + d.rotate + ")"
	  ).text (d) -> d.text

	fill = d3.scale.category20()

	drawWordCloud = (asyncData) ->
		d3.layout.cloud().size([ 300, 300 ]).words(asyncData.map((d) ->
		  text: d.name
		  size: d.count * 50
		)).padding(5).rotate(-> ~~(Math.random() * 2) * 90
		).font("Arial").fontSize((d) -> d.size
		).on("end", draw).start()
