/* TODO
* this is getting the seconds in a weird way (depending on the text)
* this is masking the weird seconds by hiding the display the time is updated
* causes an unnecessary if statement in increment()
*/

var timer_text = document.getElementById("timer");
timer_text.style.display = "none";
var seconds = timer_text.innerHTML;

setInterval('increment()', 1000);


function increment() {
    seconds ++;

    seconds_text = seconds % 60;
    minutes_text = Math.floor(seconds/60) % 60;
    hours_text = Math.floor(minutes_text / 60);

    if (seconds_text < 10){ seconds_text = '0' + seconds_text; }
    if (minutes_text < 10) { minutes_text = '0' + minutes_text; }
    if (hours_text < 10) { hours_text = '0' + hours_text; }

    timer_text.innerHTML = hours_text + ": " + minutes_text + " : " + seconds_text;
    
    if (timer_text.style.display == "none"){
        timer_text.style.display = "block";
    }
}