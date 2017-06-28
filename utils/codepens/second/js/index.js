window.onload = function draw(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  
  var scores = [10,20,5, 30,50,15]
  var curX = 10
  var width = 20
  
  scores.forEach(function(i){
    ctx.fillRect(curX,canvas.height - i,width,i)
    console.log(i)
    curX += width + 10
    
    ctx.fillStyle = 'Green'
  })
  
}