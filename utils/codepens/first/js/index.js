  var canvas = document.getElementById("mycanvas");
  var ctx = canvas.getContext("2d");
  ctx.fillStyle = 'Green';
  ctx.fillRect(0,0, 100, 200);
  ctx.fillStyle = 'Navy';

  ctx.arc(100,100, 50, 0 , 2 * Math.PI ,false)
  ctx.fill();