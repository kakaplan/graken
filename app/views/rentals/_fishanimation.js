var fishDiv = document.getElementById("rental-fish-animation");

var xPos = -150;
yPos = 0;

var t = 0;
setInterval(frame, 4);
t ++;

function frame() {
    if (xPos >= window.innerWidth) {
        t = 0;
        xPos = -150;
    }
    xPos ++;
    yPos = 20*Math.sin(t*0.02);
    t ++;

    fishDiv.style.left = xPos + 'px';
    fishDiv.style.top = yPos + 'px';
}
