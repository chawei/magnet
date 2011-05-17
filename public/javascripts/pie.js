Raphael.fn.pieChart = function (cx, cy, r, values, labels, stroke) {
    var paper = this,
        rad = Math.PI / 180,
        len = values.length,
        chart = this.set();
        
    if (len == 1) {
      var color = "#666600",
          ms = 500,
          p = paper.circle(cx, cy, r).attr({fill: color, stroke: stroke}),
          txt = paper.text(cx, cy - 230, labels[0]).attr({fill: color, stroke: "none", opacity: 0, "font-family": 'Trade-Gothic-Bold, Arial', "font-size": "18px"});
      
      p.mouseover(function () {
          p.animate({scale: [1.1, 1.1, cx, cy]}, ms, "elastic");
          txt.animate({opacity: 1}, 50, "elastic");
      }).mouseout(function () {
          p.animate({scale: [1, 1, cx, cy]}, ms, "elastic");
          txt.animate({opacity: 0}, 50);
      });
      chart.push(p);
      chart.push(txt);
      total = values[0];
    } else {
      function sector(cx, cy, r, startAngle, endAngle, params) {
          var x1 = cx + r * Math.cos(-startAngle * rad),
              x2 = cx + r * Math.cos(-endAngle * rad),
              y1 = cy + r * Math.sin(-startAngle * rad),
              y2 = cy + r * Math.sin(-endAngle * rad);
          return paper.path(["M", cx, cy, "L", x1, y1, "A", r, r, 0, +(endAngle - startAngle > 180), 0, x2, y2, "z"]).attr(params);
      }
      var angle = 0,
          total = 0,
          start = 0,
          process = function (j) {
              var value = values[j],
                  angleplus = 360 * value / total,
                  popangle = angle + (angleplus / 2),
                  color = "#666600",
                  ms = 500,
                  delta = 30,
                  bcolor = "#666600",
                  p = sector(cx, cy, r, angle, angle + angleplus, {fill: color, stroke: stroke, "stroke-width": 1.5}),
                  txt = paper.text(cx + (r + delta + 55) * Math.cos(-popangle * rad), cy + (r + delta + 25) * Math.sin(-popangle * rad), labels[j]).attr({fill: bcolor, stroke: "none", opacity: 0, "font-family": 'Trade-Gothic-Bold, Arial', "font-size": "18px"});
              p.mouseover(function () {
                  p.animate({scale: [1.1, 1.1, cx, cy]}, ms, "elastic");
                  txt.animate({opacity: 1}, 50, "elastic");
              }).mouseout(function () {
                  p.animate({scale: [1, 1, cx, cy]}, ms, "elastic");
                  txt.animate({opacity: 0}, 50);
              });
              angle += angleplus;
              chart.push(p);
              chart.push(txt);
              start += .1;
          };
      for (var i = 0, ii = values.length; i < ii; i++) {
          total += values[i];
      }
      for (var i = 0; i < ii; i++) {
          process(i);
      }
    }
    return chart;
};

(function (raphael) {
    var width = 660;
    $(function () {
        var values = [],
            labels = [];
        $("tr").each(function () {
            values.push(parseInt($("td", this).text(), 10));
            labels.push($("th", this).text());
        });
        $("table").hide();
        raphael("piechart", width, 600).pieChart(width/2, 300, 170, values, labels, "#fff");
    });
})(Raphael.ninja());